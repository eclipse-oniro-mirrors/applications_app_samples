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
export default function ratioPageStateFlow2Test(): void {
  describe('RatioPageStateFlow2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0048
     * @tc.name      WindowRatio_RatioPageStateFlow_0048
     * @tc.desc      RatioPageState call flow apply > select > select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0048 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(185);
      logInfo(`step2 select(185): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(-39);
      logInfo(`step3 select(-39): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(0, 960);
      logInfo(`step4 onSizeChange(0, 960): step4=${step4}`);
      expect(step4).assertEqual('0 x 960');
      const step5: string = subject.select(49.7);
      logInfo(`step5 select(49.7): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>select>select>onSizeChange>select f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(49.7, PRECISION);
      logInfo(`apply>select>select>onSizeChange>select f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select>onSizeChange>select f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select>onSizeChange>select f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>select>select>onSizeChange>select f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`apply>select>select>onSizeChange>select f...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0049
     * @tc.name      WindowRatio_RatioPageStateFlow_0049
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0049 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(100);
      logInfo(`step1 select(100): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(95);
      logInfo(`step2 select(95): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(95);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0050
     * @tc.name      WindowRatio_RatioPageStateFlow_0050
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0050 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(-1, 768);
      logInfo(`step3 onSizeChange(-1, 768): step3=${step3}`);
      expect(step3).assertEqual('-1 x 768');
      const step4: string = subject.onSizeChange(192, 1056);
      logInfo(`step4 onSizeChange(192, 1056): step4=${step4}`);
      expect(step4).assertEqual('192 x 1056');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>apply>onSizeChange>onSizeChange>app...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`apply>apply>onSizeChange>onSizeChange>app...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`apply>apply>onSizeChange>onSizeChange>app...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0051
     * @tc.name      WindowRatio_RatioPageStateFlow_0051
     * @tc.desc      RatioPageState call flow select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0051 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-17);
      logInfo(`step1 select(-17): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 1728);
      logInfo(`step2 onSizeChange(0, 1728): step2=${step2}`);
      expect(step2).assertEqual('0 x 1728');
      logInfo(`select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-17);
      logInfo(`select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0052
     * @tc.name      WindowRatio_RatioPageStateFlow_0052
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0052 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(147);
      logInfo(`step1 select(147): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(147);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0053
     * @tc.name      WindowRatio_RatioPageStateFlow_0053
     * @tc.desc      RatioPageState call flow select > select > apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0053 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(157);
      logInfo(`step1 select(157): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(169);
      logInfo(`step2 select(169): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(-1, 1632);
      logInfo(`step4 onSizeChange(-1, 1632): step4=${step4}`);
      expect(step4).assertEqual('-1 x 1632');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(169);
      logInfo(`select>select>apply>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`select>select>apply>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`select>select>apply>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0054
     * @tc.name      WindowRatio_RatioPageStateFlow_0054
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0054 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1824, 192);
      logInfo(`step2 onSizeChange(1824, 192): step2=${step2}`);
      expect(step2).assertEqual('1824 x 192');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      const step5: string = subject.select(109);
      logInfo(`step5 select(109): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(109);
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1824');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0055
     * @tc.name      WindowRatio_RatioPageStateFlow_0055
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply > select > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0055 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 768);
      logInfo(`step1 onSizeChange(0, 768): step1=${step1}`);
      expect(step1).assertEqual('0 x 768');
      const step2: string = subject.onSizeChange(384, 480);
      logInfo(`step2 onSizeChange(384, 480): step2=${step2}`);
      expect(step2).assertEqual('384 x 480');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(77.16);
      logInfo(`step4 select(77.16): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(77.16, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('384');
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0056
     * @tc.name      WindowRatio_RatioPageStateFlow_0056
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0056 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 864);
      logInfo(`step1 onSizeChange(0, 864): step1=${step1}`);
      expect(step1).assertEqual('0 x 864');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0057
     * @tc.name      WindowRatio_RatioPageStateFlow_0057
     * @tc.desc      RatioPageState call flow apply > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0057 begin`);
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
      logInfo(`apply>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0058
     * @tc.name      WindowRatio_RatioPageStateFlow_0058
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0058 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(197);
      logInfo(`step1 select(197): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(197);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0059
     * @tc.name      WindowRatio_RatioPageStateFlow_0059
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > apply > onSizeChange keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0059 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(3, 1056);
      logInfo(`step1 onSizeChange(3, 1056): step1=${step1}`);
      expect(step1).assertEqual('3 x 1056');
      const step2: string = subject.onSizeChange(1536, 10);
      logInfo(`step2 onSizeChange(1536, 10): step2=${step2}`);
      expect(step2).assertEqual('1536 x 10');
      const step3: string = subject.onSizeChange(0, 3);
      logInfo(`step3 onSizeChange(0, 3): step3=${step3}`);
      expect(step3).assertEqual('0 x 3');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      const step5: string = subject.onSizeChange(1536, 1728);
      logInfo(`step5 onSizeChange(1536, 1728): step5=${step5}`);
      expect(step5).assertEqual('1536 x 1728');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1536');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0060
     * @tc.name      WindowRatio_RatioPageStateFlow_0060
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > onSizeChange > onSizeChange keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0060 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(384, 720);
      logInfo(`step1 onSizeChange(384, 720): step1=${step1}`);
      expect(step1).assertEqual('384 x 720');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(100);
      logInfo(`step3 select(100): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(192, -1);
      logInfo(`step4 onSizeChange(192, -1): step4=${step4}`);
      expect(step4).assertEqual('192 x -1');
      const step5: string = subject.onSizeChange(1440, 1632);
      logInfo(`step5 onSizeChange(1440, 1632): step5=${step5}`);
      expect(step5).assertEqual('1440 x 1632');
      logInfo(`onSizeChange>apply>select>onSizeChange>on...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(100);
      logInfo(`onSizeChange>apply>select>onSizeChange>on...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>onSizeChange>on...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>onSizeChange>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`onSizeChange>apply>select>onSizeChange>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`onSizeChange>apply>select>onSizeChange>on...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0061
     * @tc.name      WindowRatio_RatioPageStateFlow_0061
     * @tc.desc      RatioPageState call flow select > apply > apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0061 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(152);
      logInfo(`step1 select(152): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(150);
      logInfo(`step4 select(150): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(150);
      logInfo(`select>apply>apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0062
     * @tc.name      WindowRatio_RatioPageStateFlow_0062
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0062 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(98.51);
      logInfo(`step1 select(98.51): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(1056, 1632);
      logInfo(`step3 onSizeChange(1056, 1632): step3=${step3}`);
      expect(step3).assertEqual('1056 x 1632');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(98.51, PRECISION);
      logInfo(`select>apply>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1056');
      logInfo(`select>apply>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`select>apply>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0063
     * @tc.name      WindowRatio_RatioPageStateFlow_0063
     * @tc.desc      RatioPageState call flow apply > apply > select > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0063 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(10);
      logInfo(`step3 select(10): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(42);
      logInfo(`step4 select(42): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.select(147);
      logInfo(`step5 select(147): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>apply>select>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(147);
      logInfo(`apply>apply>select>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0064
     * @tc.name      WindowRatio_RatioPageStateFlow_0064
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > select > onSizeChange keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0064 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 720);
      logInfo(`step1 onSizeChange(0, 720): step1=${step1}`);
      expect(step1).assertEqual('0 x 720');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-19);
      logInfo(`step3 select(-19): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(90);
      logInfo(`step4 select(90): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(720, 672);
      logInfo(`step5 onSizeChange(720, 672): step5=${step5}`);
      expect(step5).assertEqual('720 x 672');
      logInfo(`onSizeChange>apply>select>select>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(90);
      logInfo(`onSizeChange>apply>select>select>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>select>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>select>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>apply>select>select>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`onSizeChange>apply>select>select>onSizeCh...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0065
     * @tc.name      WindowRatio_RatioPageStateFlow_0065
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply > onSizeChange > select keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0065 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 864);
      logInfo(`step1 onSizeChange(0, 864): step1=${step1}`);
      expect(step1).assertEqual('0 x 864');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.onSizeChange(0, 0);
      logInfo(`step4 onSizeChange(0, 0): step4=${step4}`);
      expect(step4).assertEqual('0 x 0');
      const step5: string = subject.select(108);
      logInfo(`step5 select(108): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>apply>apply>onSizeChange>sel...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(108);
      logInfo(`onSizeChange>apply>apply>onSizeChange>sel...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>apply>onSizeChange>sel...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>apply>onSizeChange>sel...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply>apply>onSizeChange>sel...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply>apply>onSizeChange>sel...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0066
     * @tc.name      WindowRatio_RatioPageStateFlow_0066
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0066 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1632, 1152);
      logInfo(`step1 onSizeChange(1632, 1152): step1=${step1}`);
      expect(step1).assertEqual('1632 x 1152');
      const step2: string = subject.onSizeChange(768, 960);
      logInfo(`step2 onSizeChange(768, 960): step2=${step2}`);
      expect(step2).assertEqual('768 x 960');
      const step3: string = subject.select(195);
      logInfo(`step3 select(195): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(195);
      logInfo(`onSizeChange>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('768');
      logInfo(`onSizeChange>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0067
     * @tc.name      WindowRatio_RatioPageStateFlow_0067
     * @tc.desc      RatioPageState call flow apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0067 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(45);
      logInfo(`step3 select(45): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(45);
      logInfo(`apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0068
     * @tc.name      WindowRatio_RatioPageStateFlow_0068
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0068 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(960, 2);
      logInfo(`step1 onSizeChange(960, 2): step1=${step1}`);
      expect(step1).assertEqual('960 x 2');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0069
     * @tc.name      WindowRatio_RatioPageStateFlow_0069
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0069 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(480, 1344);
      logInfo(`step2 onSizeChange(480, 1344): step2=${step2}`);
      expect(step2).assertEqual('480 x 1344');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(65.16);
      logInfo(`step4 select(65.16): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(65.16, PRECISION);
      logInfo(`apply>onSizeChange>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('480');
      logInfo(`apply>onSizeChange>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`apply>onSizeChange>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0070
     * @tc.name      WindowRatio_RatioPageStateFlow_0070
     * @tc.desc      RatioPageState call flow apply > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0070 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(480, 96);
      logInfo(`step2 onSizeChange(480, 96): step2=${step2}`);
      expect(step2).assertEqual('480 x 96');
      const step3: string = subject.onSizeChange(720, 720);
      logInfo(`step3 onSizeChange(720, 720): step3=${step3}`);
      expect(step3).assertEqual('720 x 720');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0071
     * @tc.name      WindowRatio_RatioPageStateFlow_0071
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select > apply > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0071 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1, 10);
      logInfo(`step1 onSizeChange(1, 10): step1=${step1}`);
      expect(step1).assertEqual('1 x 10');
      const step2: string = subject.onSizeChange(864, 0);
      logInfo(`step2 onSizeChange(864, 0): step2=${step2}`);
      expect(step2).assertEqual('864 x 0');
      const step3: string = subject.select(172);
      logInfo(`step3 select(172): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select>apply>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(172);
      logInfo(`onSizeChange>onSizeChange>select>apply>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select>apply>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>apply>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`onSizeChange>onSizeChange>select>apply>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>onSizeChange>select>apply>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0072
     * @tc.name      WindowRatio_RatioPageStateFlow_0072
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0072 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(864, 360);
      logInfo(`step2 onSizeChange(864, 360): step2=${step2}`);
      expect(step2).assertEqual('864 x 360');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0073
     * @tc.name      WindowRatio_RatioPageStateFlow_0073
     * @tc.desc      RatioPageState call flow select > onSizeChange > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0073 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(14);
      logInfo(`step1 select(14): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(360, 2);
      logInfo(`step2 onSizeChange(360, 2): step2=${step2}`);
      expect(step2).assertEqual('360 x 2');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(1248, 384);
      logInfo(`step4 onSizeChange(1248, 384): step4=${step4}`);
      expect(step4).assertEqual('1248 x 384');
      logInfo(`select>onSizeChange>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(14);
      logInfo(`select>onSizeChange>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1248');
      logInfo(`select>onSizeChange>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`select>onSizeChange>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0074
     * @tc.name      WindowRatio_RatioPageStateFlow_0074
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0074 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(864, 480);
      logInfo(`step1 onSizeChange(864, 480): step1=${step1}`);
      expect(step1).assertEqual('864 x 480');
      const step2: string = subject.select(25);
      logInfo(`step2 select(25): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(0, 96);
      logInfo(`step3 onSizeChange(0, 96): step3=${step3}`);
      expect(step3).assertEqual('0 x 96');
      logInfo(`onSizeChange>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(25);
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0075
     * @tc.name      WindowRatio_RatioPageStateFlow_0075
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0075 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(115);
      logInfo(`step1 select(115): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(80);
      logInfo(`step2 select(80): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(80);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0076
     * @tc.name      WindowRatio_RatioPageStateFlow_0076
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0076 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(360, 0);
      logInfo(`step1 onSizeChange(360, 0): step1=${step1}`);
      expect(step1).assertEqual('360 x 0');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(176);
      logInfo(`step3 select(176): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(70);
      logInfo(`step4 select(70): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(70);
      logInfo(`onSizeChange>apply>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange>apply>select>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0077
     * @tc.name      WindowRatio_RatioPageStateFlow_0077
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0077 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(2, 1920);
      logInfo(`step1 onSizeChange(2, 1920): step1=${step1}`);
      expect(step1).assertEqual('2 x 1920');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(169);
      logInfo(`step4 select(169): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(169);
      logInfo(`onSizeChange>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange>apply>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`onSizeChange>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0078
     * @tc.name      WindowRatio_RatioPageStateFlow_0078
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0078 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 1824);
      logInfo(`step1 onSizeChange(0, 1824): step1=${step1}`);
      expect(step1).assertEqual('0 x 1824');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0079
     * @tc.name      WindowRatio_RatioPageStateFlow_0079
     * @tc.desc      RatioPageState call flow select > select > apply > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0079 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(106);
      logInfo(`step1 select(106): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(152);
      logInfo(`step2 select(152): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.onSizeChange(1920, 480);
      logInfo(`step5 onSizeChange(1920, 480): step5=${step5}`);
      expect(step5).assertEqual('1920 x 480');
      logInfo(`select>select>apply>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(152);
      logInfo(`select>select>apply>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`select>select>apply>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`select>select>apply>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0080
     * @tc.name      WindowRatio_RatioPageStateFlow_0080
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > onSizeChange > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0080 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(39);
      logInfo(`step1 select(39): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(0, 3);
      logInfo(`step3 onSizeChange(0, 3): step3=${step3}`);
      expect(step3).assertEqual('0 x 3');
      const step4: string = subject.onSizeChange(720, 672);
      logInfo(`step4 onSizeChange(720, 672): step4=${step4}`);
      expect(step4).assertEqual('720 x 672');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(39);
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0081
     * @tc.name      WindowRatio_RatioPageStateFlow_0081
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > onSizeChange > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0081 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(576, 864);
      logInfo(`step1 onSizeChange(576, 864): step1=${step1}`);
      expect(step1).assertEqual('576 x 864');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(60);
      logInfo(`step3 select(60): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(192, 1920);
      logInfo(`step4 onSizeChange(192, 1920): step4=${step4}`);
      expect(step4).assertEqual('192 x 1920');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>onSizeChange>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(60);
      logInfo(`onSizeChange>apply>select>onSizeChange>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>onSizeChange>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>onSizeChange>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`onSizeChange>apply>select>onSizeChange>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`onSizeChange>apply>select>onSizeChange>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0082
     * @tc.name      WindowRatio_RatioPageStateFlow_0082
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select > apply > onSizeChange keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0082 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1920, 768);
      logInfo(`step1 onSizeChange(1920, 768): step1=${step1}`);
      expect(step1).assertEqual('1920 x 768');
      const step2: string = subject.onSizeChange(2, 1728);
      logInfo(`step2 onSizeChange(2, 1728): step2=${step2}`);
      expect(step2).assertEqual('2 x 1728');
      const step3: string = subject.select(4);
      logInfo(`step3 select(4): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.onSizeChange(100, 1728);
      logInfo(`step5 onSizeChange(100, 1728): step5=${step5}`);
      expect(step5).assertEqual('100 x 1728');
      logInfo(`onSizeChange>onSizeChange>select>apply>on...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(4);
      logInfo(`onSizeChange>onSizeChange>select>apply>on...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select>apply>on...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>apply>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange>onSizeChange>select>apply>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`onSizeChange>onSizeChange>select>apply>on...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0083
     * @tc.name      WindowRatio_RatioPageStateFlow_0083
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0083 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(960, 0);
      logInfo(`step1 onSizeChange(960, 0): step1=${step1}`);
      expect(step1).assertEqual('960 x 0');
      const step2: string = subject.onSizeChange(1, 96);
      logInfo(`step2 onSizeChange(1, 96): step2=${step2}`);
      expect(step2).assertEqual('1 x 96');
      logInfo(`onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0084
     * @tc.name      WindowRatio_RatioPageStateFlow_0084
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply > onSizeChange > onSizeChange keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0084 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1824, 0);
      logInfo(`step1 onSizeChange(1824, 0): step1=${step1}`);
      expect(step1).assertEqual('1824 x 0');
      const step2: string = subject.select(80);
      logInfo(`step2 select(80): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(1920, 0);
      logInfo(`step4 onSizeChange(1920, 0): step4=${step4}`);
      expect(step4).assertEqual('1920 x 0');
      const step5: string = subject.onSizeChange(1248, 1824);
      logInfo(`step5 onSizeChange(1248, 1824): step5=${step5}`);
      expect(step5).assertEqual('1248 x 1824');
      logInfo(`onSizeChange>select>apply>onSizeChange>on...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(80);
      logInfo(`onSizeChange>select>apply>onSizeChange>on...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply>onSizeChange>on...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>onSizeChange>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1248');
      logInfo(`onSizeChange>select>apply>onSizeChange>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`onSizeChange>select>apply>onSizeChange>on...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0085
     * @tc.name      WindowRatio_RatioPageStateFlow_0085
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0085 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 960);
      logInfo(`step1 onSizeChange(0, 960): step1=${step1}`);
      expect(step1).assertEqual('0 x 960');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0086
     * @tc.name      WindowRatio_RatioPageStateFlow_0086
     * @tc.desc      RatioPageState call flow select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0086 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(34);
      logInfo(`step1 select(34): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(2, 1728);
      logInfo(`step2 onSizeChange(2, 1728): step2=${step2}`);
      expect(step2).assertEqual('2 x 1728');
      const step3: string = subject.select(113);
      logInfo(`step3 select(113): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`select>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(113);
      logInfo(`select>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`select>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0087
     * @tc.name      WindowRatio_RatioPageStateFlow_0087
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0087 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 672);
      logInfo(`step1 onSizeChange(0, 672): step1=${step1}`);
      expect(step1).assertEqual('0 x 672');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(960, 2);
      logInfo(`step3 onSizeChange(960, 2): step3=${step3}`);
      expect(step3).assertEqual('960 x 2');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0088
     * @tc.name      WindowRatio_RatioPageStateFlow_0088
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0088 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1920, 1536);
      logInfo(`step2 onSizeChange(1920, 1536): step2=${step2}`);
      expect(step2).assertEqual('1920 x 1536');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0089
     * @tc.name      WindowRatio_RatioPageStateFlow_0089
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0089 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(960, 0);
      logInfo(`step1 onSizeChange(960, 0): step1=${step1}`);
      expect(step1).assertEqual('960 x 0');
      const step2: string = subject.select(157);
      logInfo(`step2 select(157): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(125);
      logInfo(`step4 select(125): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(125);
      logInfo(`onSizeChange>select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`onSizeChange>select>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0090
     * @tc.name      WindowRatio_RatioPageStateFlow_0090
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0090 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1440, 1632);
      logInfo(`step1 onSizeChange(1440, 1632): step1=${step1}`);
      expect(step1).assertEqual('1440 x 1632');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0091
     * @tc.name      WindowRatio_RatioPageStateFlow_0091
     * @tc.desc      RatioPageState call flow apply > apply > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0091 begin`);
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
      const step4: string = subject.onSizeChange(720, 360);
      logInfo(`step4 onSizeChange(720, 360): step4=${step4}`);
      expect(step4).assertEqual('720 x 360');
      logInfo(`apply>apply>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`apply>apply>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`apply>apply>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0092
     * @tc.name      WindowRatio_RatioPageStateFlow_0092
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0092 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(288, 10);
      logInfo(`step1 onSizeChange(288, 10): step1=${step1}`);
      expect(step1).assertEqual('288 x 10');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('288');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0092 end`);
    });
  });
}
