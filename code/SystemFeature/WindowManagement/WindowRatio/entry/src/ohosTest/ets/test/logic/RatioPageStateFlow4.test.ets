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
export default function ratioPageStateFlow4Test(): void {
  describe('RatioPageStateFlow4Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0137
     * @tc.name      WindowRatio_RatioPageStateFlow_0137
     * @tc.desc      RatioPageState call flow select > apply > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0137 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(128);
      logInfo(`step1 select(128): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(95);
      logInfo(`step3 select(95): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(1536, 720);
      logInfo(`step4 onSizeChange(1536, 720): step4=${step4}`);
      expect(step4).assertEqual('1536 x 720');
      logInfo(`select>apply>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(95);
      logInfo(`select>apply>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1536');
      logInfo(`select>apply>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`select>apply>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0138
     * @tc.name      WindowRatio_RatioPageStateFlow_0138
     * @tc.desc      RatioPageState call flow apply > apply > apply > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0138 begin`);
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
      const step4: string = subject.select(52);
      logInfo(`step4 select(52): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(0, 576);
      logInfo(`step5 onSizeChange(0, 576): step5=${step5}`);
      expect(step5).assertEqual('0 x 576');
      logInfo(`apply>apply>apply>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(52);
      logInfo(`apply>apply>apply>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>apply>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>apply>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>apply>apply>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`apply>apply>apply>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0139
     * @tc.name      WindowRatio_RatioPageStateFlow_0139
     * @tc.desc      RatioPageState call flow apply > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0139 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1728, 0);
      logInfo(`step2 onSizeChange(1728, 0): step2=${step2}`);
      expect(step2).assertEqual('1728 x 0');
      const step3: string = subject.onSizeChange(100, 96);
      logInfo(`step3 onSizeChange(100, 96): step3=${step3}`);
      expect(step3).assertEqual('100 x 96');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0140
     * @tc.name      WindowRatio_RatioPageStateFlow_0140
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0140 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(70);
      logInfo(`step1 select(70): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(70);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0141
     * @tc.name      WindowRatio_RatioPageStateFlow_0141
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > onSizeChange > select keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0141 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(80);
      logInfo(`step1 select(80): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(480, 0);
      logInfo(`step3 onSizeChange(480, 0): step3=${step3}`);
      expect(step3).assertEqual('480 x 0');
      const step4: string = subject.onSizeChange(576, 360);
      logInfo(`step4 onSizeChange(576, 360): step4=${step4}`);
      expect(step4).assertEqual('576 x 360');
      const step5: string = subject.select(195);
      logInfo(`step5 select(195): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>onSizeChange>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(195);
      logInfo(`select>apply>onSizeChange>onSizeChange>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>onSizeChange>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>onSizeChange>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`select>apply>onSizeChange>onSizeChange>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`select>apply>onSizeChange>onSizeChange>se...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0142
     * @tc.name      WindowRatio_RatioPageStateFlow_0142
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0142 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(65.16);
      logInfo(`step1 select(65.16): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(65.16, PRECISION);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0143
     * @tc.name      WindowRatio_RatioPageStateFlow_0143
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0143 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(720, 0);
      logInfo(`step1 onSizeChange(720, 0): step1=${step1}`);
      expect(step1).assertEqual('720 x 0');
      const step2: string = subject.select(75);
      logInfo(`step2 select(75): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1920, 1536);
      logInfo(`step3 onSizeChange(1920, 1536): step3=${step3}`);
      expect(step3).assertEqual('1920 x 1536');
      logInfo(`onSizeChange>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(75);
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0144
     * @tc.name      WindowRatio_RatioPageStateFlow_0144
     * @tc.desc      RatioPageState call flow apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0144 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-11);
      logInfo(`step3 select(-11): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-11);
      logInfo(`apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0145
     * @tc.name      WindowRatio_RatioPageStateFlow_0145
     * @tc.desc      RatioPageState call flow apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0145 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(24);
      logInfo(`step2 select(24): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(24);
      logInfo(`apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0146
     * @tc.name      WindowRatio_RatioPageStateFlow_0146
     * @tc.desc      RatioPageState call flow select > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0146 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(62);
      logInfo(`step1 select(62): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(17.23);
      logInfo(`step4 select(17.23): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(17.23, PRECISION);
      logInfo(`select>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0147
     * @tc.name      WindowRatio_RatioPageStateFlow_0147
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0147 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1632, 960);
      logInfo(`step1 onSizeChange(1632, 960): step1=${step1}`);
      expect(step1).assertEqual('1632 x 960');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0148
     * @tc.name      WindowRatio_RatioPageStateFlow_0148
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0148 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(960, 1824);
      logInfo(`step2 onSizeChange(960, 1824): step2=${step2}`);
      expect(step2).assertEqual('960 x 1824');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      const step5: string = subject.select(91);
      logInfo(`step5 select(91): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(91);
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0149
     * @tc.name      WindowRatio_RatioPageStateFlow_0149
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0149 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(169);
      logInfo(`step1 select(169): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1920, 768);
      logInfo(`step2 onSizeChange(1920, 768): step2=${step2}`);
      expect(step2).assertEqual('1920 x 768');
      const step3: string = subject.select(173);
      logInfo(`step3 select(173): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.select(60.46);
      logInfo(`step5 select(60.46): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>apply>select f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(60.46, PRECISION);
      logInfo(`select>onSizeChange>select>apply>select f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>apply>select f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>apply>select f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`select>onSizeChange>select>apply>select f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`select>onSizeChange>select>apply>select f...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0150
     * @tc.name      WindowRatio_RatioPageStateFlow_0150
     * @tc.desc      RatioPageState call flow select > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0150 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(98.51);
      logInfo(`step1 select(98.51): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(960, 768);
      logInfo(`step2 onSizeChange(960, 768): step2=${step2}`);
      expect(step2).assertEqual('960 x 768');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(98.51, PRECISION);
      logInfo(`select>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`select>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`select>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0151
     * @tc.name      WindowRatio_RatioPageStateFlow_0151
     * @tc.desc      RatioPageState call flow select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0151 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(85.78);
      logInfo(`step1 select(85.78): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(-63);
      logInfo(`step2 select(-63): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-63);
      logInfo(`select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0152
     * @tc.name      WindowRatio_RatioPageStateFlow_0152
     * @tc.desc      RatioPageState call flow apply > select > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0152 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(85);
      logInfo(`step2 select(85): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1920, 10);
      logInfo(`step3 onSizeChange(1920, 10): step3=${step3}`);
      expect(step3).assertEqual('1920 x 10');
      const step4: string = subject.onSizeChange(0, 576);
      logInfo(`step4 onSizeChange(0, 576): step4=${step4}`);
      expect(step4).assertEqual('0 x 576');
      logInfo(`apply>select>onSizeChange>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(85);
      logInfo(`apply>select>onSizeChange>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>onSizeChange>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>select>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`apply>select>onSizeChange>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0153
     * @tc.name      WindowRatio_RatioPageStateFlow_0153
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0153 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1920, 3);
      logInfo(`step1 onSizeChange(1920, 3): step1=${step1}`);
      expect(step1).assertEqual('1920 x 3');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0154
     * @tc.name      WindowRatio_RatioPageStateFlow_0154
     * @tc.desc      RatioPageState call flow apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0154 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-64);
      logInfo(`step2 select(-64): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-64);
      logInfo(`apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0155
     * @tc.name      WindowRatio_RatioPageStateFlow_0155
     * @tc.desc      RatioPageState call flow apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0155 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(90);
      logInfo(`step2 select(90): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(90);
      logInfo(`apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0156
     * @tc.name      WindowRatio_RatioPageStateFlow_0156
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0156 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(384, 480);
      logInfo(`step1 onSizeChange(384, 480): step1=${step1}`);
      expect(step1).assertEqual('384 x 480');
      const step2: string = subject.select(40);
      logInfo(`step2 select(40): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(1);
      logInfo(`step3 select(1): step3=${step3}`);
      expect(step3).assertEqual('1:1');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`onSizeChange>select>select>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(1);
      logInfo(`onSizeChange>select>select>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertEqual(1);
      logInfo(`onSizeChange>select>select>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('1:1');
      logInfo(`onSizeChange>select>select>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('384');
      logInfo(`onSizeChange>select>select>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`onSizeChange>select>select>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0157
     * @tc.name      WindowRatio_RatioPageStateFlow_0157
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0157 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 1632);
      logInfo(`step1 onSizeChange(0, 1632): step1=${step1}`);
      expect(step1).assertEqual('0 x 1632');
      const step2: string = subject.select(76);
      logInfo(`step2 select(76): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(720, 0);
      logInfo(`step3 onSizeChange(720, 0): step3=${step3}`);
      expect(step3).assertEqual('720 x 0');
      const step4: string = subject.onSizeChange(576, 1728);
      logInfo(`step4 onSizeChange(576, 1728): step4=${step4}`);
      expect(step4).assertEqual('576 x 1728');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(76);
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0158
     * @tc.name      WindowRatio_RatioPageStateFlow_0158
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0158 begin`);
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
      const step4: string = subject.onSizeChange(960, 1824);
      logInfo(`step4 onSizeChange(960, 1824): step4=${step4}`);
      expect(step4).assertEqual('960 x 1824');
      logInfo(`onSizeChange>apply>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`onSizeChange>apply>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`onSizeChange>apply>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0159
     * @tc.name      WindowRatio_RatioPageStateFlow_0159
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0159 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(10, 1248);
      logInfo(`step2 onSizeChange(10, 1248): step2=${step2}`);
      expect(step2).assertEqual('10 x 1248');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0160
     * @tc.name      WindowRatio_RatioPageStateFlow_0160
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0160 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1728, 1824);
      logInfo(`step1 onSizeChange(1728, 1824): step1=${step1}`);
      expect(step1).assertEqual('1728 x 1824');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1728');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0161
     * @tc.name      WindowRatio_RatioPageStateFlow_0161
     * @tc.desc      RatioPageState call flow apply > select > apply > onSizeChange > onSizeChange keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0161 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(35.98);
      logInfo(`step2 select(35.98): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(0, 1728);
      logInfo(`step4 onSizeChange(0, 1728): step4=${step4}`);
      expect(step4).assertEqual('0 x 1728');
      const step5: string = subject.onSizeChange(100, 1728);
      logInfo(`step5 onSizeChange(100, 1728): step5=${step5}`);
      expect(step5).assertEqual('100 x 1728');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(35.98, PRECISION);
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0162
     * @tc.name      WindowRatio_RatioPageStateFlow_0162
     * @tc.desc      RatioPageState call flow select > onSizeChange > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0162 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(160);
      logInfo(`step1 select(160): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1824, 192);
      logInfo(`step2 onSizeChange(1824, 192): step2=${step2}`);
      expect(step2).assertEqual('1824 x 192');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(125);
      logInfo(`step4 select(125): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(125);
      logInfo(`select>onSizeChange>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1824');
      logInfo(`select>onSizeChange>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`select>onSizeChange>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0163
     * @tc.name      WindowRatio_RatioPageStateFlow_0163
     * @tc.desc      RatioPageState call flow apply > select > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0163 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-52);
      logInfo(`step2 select(-52): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-52);
      logInfo(`apply>select>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0164
     * @tc.name      WindowRatio_RatioPageStateFlow_0164
     * @tc.desc      RatioPageState call flow apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0164 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-23);
      logInfo(`step2 select(-23): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-23);
      logInfo(`apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0165
     * @tc.name      WindowRatio_RatioPageStateFlow_0165
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0165 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(960, 1824);
      logInfo(`step1 onSizeChange(960, 1824): step1=${step1}`);
      expect(step1).assertEqual('960 x 1824');
      const step2: string = subject.select(55);
      logInfo(`step2 select(55): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(35.98);
      logInfo(`step3 select(35.98): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(0, 864);
      logInfo(`step4 onSizeChange(0, 864): step4=${step4}`);
      expect(step4).assertEqual('0 x 864');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(35.98, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0166
     * @tc.name      WindowRatio_RatioPageStateFlow_0166
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0166 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(100, 1);
      logInfo(`step1 onSizeChange(100, 1): step1=${step1}`);
      expect(step1).assertEqual('100 x 1');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0167
     * @tc.name      WindowRatio_RatioPageStateFlow_0167
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0167 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(10, 1);
      logInfo(`step1 onSizeChange(10, 1): step1=${step1}`);
      expect(step1).assertEqual('10 x 1');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0168
     * @tc.name      WindowRatio_RatioPageStateFlow_0168
     * @tc.desc      RatioPageState call flow apply > apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0168 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(4.79);
      logInfo(`step3 select(4.79): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(4.79, PRECISION);
      logInfo(`apply>apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0169
     * @tc.name      WindowRatio_RatioPageStateFlow_0169
     * @tc.desc      RatioPageState call flow apply > apply > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0169 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-15);
      logInfo(`step3 select(-15): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(3, 0);
      logInfo(`step4 onSizeChange(3, 0): step4=${step4}`);
      expect(step4).assertEqual('3 x 0');
      logInfo(`apply>apply>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-15);
      logInfo(`apply>apply>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`apply>apply>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>apply>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0170
     * @tc.name      WindowRatio_RatioPageStateFlow_0170
     * @tc.desc      RatioPageState call flow select > select > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0170 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(85.78);
      logInfo(`step1 select(85.78): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(35.98);
      logInfo(`step2 select(35.98): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(0, 1632);
      logInfo(`step3 onSizeChange(0, 1632): step3=${step3}`);
      expect(step3).assertEqual('0 x 1632');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(35.98, PRECISION);
      logInfo(`select>select>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>select>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`select>select>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0171
     * @tc.name      WindowRatio_RatioPageStateFlow_0171
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0171 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-4);
      logInfo(`step1 select(-4): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(-11);
      logInfo(`step2 select(-11): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-11);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0172
     * @tc.name      WindowRatio_RatioPageStateFlow_0172
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0172 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1344, 96);
      logInfo(`step1 onSizeChange(1344, 96): step1=${step1}`);
      expect(step1).assertEqual('1344 x 96');
      const step2: string = subject.select(30);
      logInfo(`step2 select(30): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(30);
      logInfo(`step3 select(30): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(30);
      logInfo(`onSizeChange>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1344');
      logInfo(`onSizeChange>select>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`onSizeChange>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0173
     * @tc.name      WindowRatio_RatioPageStateFlow_0173
     * @tc.desc      RatioPageState call flow apply > apply > select > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0173 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(28);
      logInfo(`step3 select(28): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(28);
      logInfo(`apply>apply>select>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(4);
      logInfo(`${BUNDLE}RatioPageStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0174
     * @tc.name      WindowRatio_RatioPageStateFlow_0174
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > onSizeChange > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0174 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(5);
      logInfo(`step1 select(5): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(10, 1);
      logInfo(`step3 onSizeChange(10, 1): step3=${step3}`);
      expect(step3).assertEqual('10 x 1');
      const step4: string = subject.onSizeChange(0, 1536);
      logInfo(`step4 onSizeChange(0, 1536): step4=${step4}`);
      expect(step4).assertEqual('0 x 1536');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(5);
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`select>apply>onSizeChange>onSizeChange>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0175
     * @tc.name      WindowRatio_RatioPageStateFlow_0175
     * @tc.desc      RatioPageState call flow select > apply > select > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0175 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-1);
      logInfo(`step1 select(-1): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(79);
      logInfo(`step3 select(79): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(2, 0);
      logInfo(`step4 onSizeChange(2, 0): step4=${step4}`);
      expect(step4).assertEqual('2 x 0');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(79);
      logInfo(`select>apply>select>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`select>apply>select>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`select>apply>select>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0176
     * @tc.name      WindowRatio_RatioPageStateFlow_0176
     * @tc.desc      RatioPageState call flow apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0176 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(65.28);
      logInfo(`step2 select(65.28): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(65.28, PRECISION);
      logInfo(`apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0177
     * @tc.name      WindowRatio_RatioPageStateFlow_0177
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0177 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(384, 0);
      logInfo(`step1 onSizeChange(384, 0): step1=${step1}`);
      expect(step1).assertEqual('384 x 0');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('384');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0178
     * @tc.name      WindowRatio_RatioPageStateFlow_0178
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0178 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(35);
      logInfo(`step1 select(35): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1536, 720);
      logInfo(`step2 onSizeChange(1536, 720): step2=${step2}`);
      expect(step2).assertEqual('1536 x 720');
      const step3: string = subject.select(178);
      logInfo(`step3 select(178): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(178);
      logInfo(`select>onSizeChange>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1536');
      logInfo(`select>onSizeChange>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`select>onSizeChange>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0179
     * @tc.name      WindowRatio_RatioPageStateFlow_0179
     * @tc.desc      RatioPageState call flow apply > apply > select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0179 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(80);
      logInfo(`step3 select(80): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.select(75);
      logInfo(`step5 select(75): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>apply>select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(75);
      logInfo(`apply>apply>select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0180
     * @tc.name      WindowRatio_RatioPageStateFlow_0180
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0180 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(864, 480);
      logInfo(`step1 onSizeChange(864, 480): step1=${step1}`);
      expect(step1).assertEqual('864 x 480');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0181
     * @tc.name      WindowRatio_RatioPageStateFlow_0181
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0181 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(480, -1);
      logInfo(`step1 onSizeChange(480, -1): step1=${step1}`);
      expect(step1).assertEqual('480 x -1');
      const step2: string = subject.select(62);
      logInfo(`step2 select(62): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(-6);
      logInfo(`step4 select(-6): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`onSizeChange>select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('480');
      logInfo(`onSizeChange>select>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`onSizeChange>select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0181 end`);
    });
  });
}
