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
import { TitleExpansionState } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for TitleExpansionState flow (56 cases). */
export default function titleExpansionStateFlow4Test(): void {
  describe('TitleExpansionStateFlow4Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0172
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0172
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0172 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(56);
      logInfo(`step2 frameBegin(56): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(165);
      logInfo(`step4 frameBegin(165): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0173
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0173
     * @tc.desc      TitleExpansionState call flow didScroll > scale > scale > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0173 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(16);
      logInfo(`step1 didScroll(16): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`didScroll>scale>scale>scale>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(16);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0174
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0174
     * @tc.desc      TitleExpansionState call flow stop > stop > frameBegin > stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0174 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(-100);
      logInfo(`step3 frameBegin(-100): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: number = subject.frameBegin(186);
      logInfo(`step5 frameBegin(186): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0175
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0175
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0175 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(140);
      logInfo(`step1 didScroll(140): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(114);
      logInfo(`step2 didScroll(114): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(114);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0176
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0176
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > opacity > didScroll > opacity keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0176 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(18.27);
      logInfo(`step1 didScroll(18.27): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(70);
      logInfo(`step2 frameBegin(70): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.didScroll(-50);
      logInfo(`step4 didScroll(-50): step4=${step4}`);
      expect(step4).assertEqual(50);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`didScroll>frameBegin>opacity>didScroll>op...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-50);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0177
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0177
     * @tc.desc      TitleExpansionState call flow scale > didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0177 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(17);
      logInfo(`step2 didScroll(17): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(25);
      logInfo(`step3 didScroll(25): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`scale>didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(25);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0178
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0178
     * @tc.desc      TitleExpansionState call flow frameBegin > stop > didScroll > frameBegin > stop keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0178 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-100);
      logInfo(`step1 frameBegin(-100): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.didScroll(90);
      logInfo(`step3 didScroll(90): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(-15);
      logInfo(`step4 frameBegin(-15): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`frameBegin>stop>didScroll>frameBegin>stop...: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`frameBegin>stop>didScroll>frameBegin>stop...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(90);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0179
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0179
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0179 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-16);
      logInfo(`step1 didScroll(-16): step1=${step1}`);
      expect(step1).assertEqual(16);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.0355555555555556, PRECISION);
      logInfo(`didScroll>opacity>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-16);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0180
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0180
     * @tc.desc      TitleExpansionState call flow frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0180 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(144);
      logInfo(`step1 frameBegin(144): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(-79);
      logInfo(`step2 frameBegin(-79): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`frameBegin>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0181
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0181
     * @tc.desc      TitleExpansionState call flow opacity > didScroll > didScroll > opacity > didScroll keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0181 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(70);
      logInfo(`step2 didScroll(70): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(107);
      logInfo(`step3 didScroll(107): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.didScroll(-48);
      logInfo(`step5 didScroll(-48): step5=${step5}`);
      expect(step5).assertEqual(48);
      logInfo(`opacity>didScroll>didScroll>opacity>didSc...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-48);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0182
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0182
     * @tc.desc      TitleExpansionState call flow opacity > stop > scale > didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0182 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.didScroll(143);
      logInfo(`step4 didScroll(143): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`opacity>stop>scale>didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(143);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0183
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0183
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0183 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(30);
      logInfo(`step1 didScroll(30): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`didScroll>opacity>scale>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(30);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0184
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0184
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > scale > didScroll > frameBegin keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0184 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-68);
      logInfo(`step1 didScroll(-68): step1=${step1}`);
      expect(step1).assertEqual(68);
      const step2: number = subject.frameBegin(192);
      logInfo(`step2 frameBegin(192): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.1511111111111112, PRECISION);
      const step4: number = subject.didScroll(93);
      logInfo(`step4 didScroll(93): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.frameBegin(190);
      logInfo(`step5 frameBegin(190): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`didScroll>frameBegin>scale>didScroll>fram...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(93);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0185
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0185
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0185 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-99);
      logInfo(`step1 frameBegin(-99): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.didScroll(110);
      logInfo(`step2 didScroll(110): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`frameBegin>didScroll final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(110);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0186
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0186
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0186 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(62);
      logInfo(`step1 didScroll(62): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(73);
      logInfo(`step2 frameBegin(73): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`didScroll>frameBegin>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(62);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0187
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0187
     * @tc.desc      TitleExpansionState call flow scale > stop > opacity > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0187 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0188
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0188
     * @tc.desc      TitleExpansionState call flow stop > didScroll > frameBegin > didScroll > opacity keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0188 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(159);
      logInfo(`step2 didScroll(159): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(123);
      logInfo(`step3 frameBegin(123): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(58);
      logInfo(`step4 didScroll(58): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`stop>didScroll>frameBegin>didScroll>opaci...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(58);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0189
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0189
     * @tc.desc      TitleExpansionState call flow didScroll > stop > scale > frameBegin > opacity keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0189 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(192);
      logInfo(`step1 didScroll(192): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.frameBegin(180);
      logInfo(`step4 frameBegin(180): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`didScroll>stop>scale>frameBegin>opacity f...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(192);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0190
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0190
     * @tc.desc      TitleExpansionState call flow stop > didScroll > opacity > opacity > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0190 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(-50);
      logInfo(`step2 didScroll(-50): step2=${step2}`);
      expect(step2).assertEqual(50);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertClose(1.1111111111111112, PRECISION);
      logInfo(`stop>didScroll>opacity>opacity>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-50);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0191
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0191
     * @tc.desc      TitleExpansionState call flow didScroll > scale > stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0191 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(80);
      logInfo(`step1 didScroll(80): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(135);
      logInfo(`step4 frameBegin(135): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`didScroll>scale>stop>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0192
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0192
     * @tc.desc      TitleExpansionState call flow scale > didScroll > stop > didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0192 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(73.82);
      logInfo(`step2 didScroll(73.82): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(120);
      logInfo(`step4 didScroll(120): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`scale>didScroll>stop>didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(120);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0193
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0193
     * @tc.desc      TitleExpansionState call flow scale > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0193 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(75);
      logInfo(`step3 didScroll(75): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`scale>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(75);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0194
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0194
     * @tc.desc      TitleExpansionState call flow frameBegin > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0194 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(90);
      logInfo(`step1 frameBegin(90): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(11);
      logInfo(`step2 frameBegin(11): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(75);
      logInfo(`step3 didScroll(75): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`frameBegin>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(75);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0195
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0195
     * @tc.desc      TitleExpansionState call flow stop > opacity > stop > didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0195 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(5);
      logInfo(`step4 didScroll(5): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`stop>opacity>stop>didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(5);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0196
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0196
     * @tc.desc      TitleExpansionState call flow stop > scale > stop > stop > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0196 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.didScroll(180);
      logInfo(`step5 didScroll(180): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`stop>scale>stop>stop>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(180);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0197
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0197
     * @tc.desc      TitleExpansionState call flow stop > didScroll > opacity > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0197 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(40);
      logInfo(`step2 didScroll(40): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(-100);
      logInfo(`step4 frameBegin(-100): step4=${step4}`);
      expect(step4).assertEqual(100);
      logInfo(`stop>didScroll>opacity>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`stop>didScroll>opacity>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(40);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0198
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0198
     * @tc.desc      TitleExpansionState call flow opacity > opacity > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0198 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0199
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0199
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin > scale > didScroll > opacity keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0199 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(54.75);
      logInfo(`step2 frameBegin(54.75): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.didScroll(54);
      logInfo(`step4 didScroll(54): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`opacity>frameBegin>scale>didScroll>opacit...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(54);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0200
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0200
     * @tc.desc      TitleExpansionState call flow scale > opacity > stop > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0200 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0201
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0201
     * @tc.desc      TitleExpansionState call flow stop > didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0201 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(51.13);
      logInfo(`step2 didScroll(51.13): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(1);
      logInfo(`step3 didScroll(1): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`stop>didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0202
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0202
     * @tc.desc      TitleExpansionState call flow frameBegin > stop > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0202 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(79);
      logInfo(`step1 frameBegin(79): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(42.09);
      logInfo(`step3 didScroll(42.09): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`frameBegin>stop>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(42.09, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0203
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0203
     * @tc.desc      TitleExpansionState call flow opacity > stop > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0203 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(32);
      logInfo(`step3 didScroll(32): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`opacity>stop>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(32);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0204
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0204
     * @tc.desc      TitleExpansionState call flow scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0204 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0205
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0205
     * @tc.desc      TitleExpansionState call flow stop > opacity > stop > frameBegin > frameBegin keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0205 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(-6);
      logInfo(`step4 frameBegin(-6): step4=${step4}`);
      expect(step4).assertEqual(86);
      const step5: number = subject.frameBegin(50);
      logInfo(`step5 frameBegin(50): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0206
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0206
     * @tc.desc      TitleExpansionState call flow frameBegin > scale > frameBegin > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0206 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(140);
      logInfo(`step1 frameBegin(140): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(166);
      logInfo(`step3 frameBegin(166): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0207
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0207
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0207 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(166);
      logInfo(`step2 frameBegin(166): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(-2);
      logInfo(`step3 frameBegin(-2): step3=${step3}`);
      expect(step3).assertEqual(82);
      logInfo(`scale>frameBegin>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(82);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0208
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0208
     * @tc.desc      TitleExpansionState call flow stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0208 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(-17);
      logInfo(`step2 frameBegin(-17): step2=${step2}`);
      expect(step2).assertEqual(97);
      logInfo(`stop>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(97);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0209
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0209
     * @tc.desc      TitleExpansionState call flow didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0209 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(17);
      logInfo(`step1 didScroll(17): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      logInfo(`didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(17);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0210
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0210
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0210 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(126);
      logInfo(`step1 frameBegin(126): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(105);
      logInfo(`step2 didScroll(105): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`frameBegin>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(105);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0211
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0211
     * @tc.desc      TitleExpansionState call flow stop > scale > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0211 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(12.41);
      logInfo(`step3 frameBegin(12.41): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0212
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0212
     * @tc.desc      TitleExpansionState call flow stop > didScroll > frameBegin > didScroll > didScroll keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0212 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(165);
      logInfo(`step2 didScroll(165): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(-79);
      logInfo(`step3 frameBegin(-79): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: number = subject.didScroll(-24);
      logInfo(`step4 didScroll(-24): step4=${step4}`);
      expect(step4).assertEqual(24);
      const step5: number = subject.didScroll(2);
      logInfo(`step5 didScroll(2): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`stop>didScroll>frameBegin>didScroll>didSc...: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`stop>didScroll>frameBegin>didScroll>didSc...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(2);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0213
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0213
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0213 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(79);
      logInfo(`step2 frameBegin(79): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0214
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0214
     * @tc.desc      TitleExpansionState call flow frameBegin > frameBegin > stop > frameBegin > stop keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0214 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(34.3);
      logInfo(`step1 frameBegin(34.3): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(85);
      logInfo(`step2 frameBegin(85): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(200);
      logInfo(`step4 frameBegin(200): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0215
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0215
     * @tc.desc      TitleExpansionState call flow stop > opacity > didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0215 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(65);
      logInfo(`step3 didScroll(65): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`stop>opacity>didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(65);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0216
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0216
     * @tc.desc      TitleExpansionState call flow scale > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0216 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(140);
      logInfo(`step2 didScroll(140): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`scale>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(140);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0217
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0217
     * @tc.desc      TitleExpansionState call flow stop > stop > scale > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0217 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.frameBegin(-1);
      logInfo(`step4 frameBegin(-1): step4=${step4}`);
      expect(step4).assertEqual(81);
      const step5: number = subject.didScroll(65.78);
      logInfo(`step5 didScroll(65.78): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`stop>stop>scale>frameBegin>didScroll final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(81);
      logInfo(`stop>stop>scale>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(65.78, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0218
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0218
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0218 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(168);
      logInfo(`step2 frameBegin(168): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(11);
      logInfo(`step3 frameBegin(11): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(177);
      logInfo(`step4 didScroll(177): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`stop>frameBegin>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(177);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0219
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0219
     * @tc.desc      TitleExpansionState call flow didScroll > scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0219 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(125);
      logInfo(`step1 didScroll(125): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(18.27);
      logInfo(`step3 didScroll(18.27): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`didScroll>scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(18.27, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0220
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0220
     * @tc.desc      TitleExpansionState call flow stop > scale > scale > scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0220 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0221
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0221
     * @tc.desc      TitleExpansionState call flow scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0221 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(86);
      logInfo(`step2 didScroll(86): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(86);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0222
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0222
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > opacity > frameBegin > stop keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0222 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(0);
      logInfo(`step1 frameBegin(0): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(140);
      logInfo(`step2 didScroll(140): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(45);
      logInfo(`step4 frameBegin(45): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`frameBegin>didScroll>opacity>frameBegin>s...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(140);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0223
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0223
     * @tc.desc      TitleExpansionState call flow stop > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0223 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0224
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0224
     * @tc.desc      TitleExpansionState call flow stop > opacity > scale > frameBegin > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0224 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.frameBegin(130);
      logInfo(`step4 frameBegin(130): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0225
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0225
     * @tc.desc      TitleExpansionState call flow didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0225 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(135);
      logInfo(`step1 didScroll(135): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      logInfo(`didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(135);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0226
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0226
     * @tc.desc      TitleExpansionState call flow didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0226 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-24);
      logInfo(`step1 didScroll(-24): step1=${step1}`);
      expect(step1).assertEqual(24);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertClose(1.0533333333333332, PRECISION);
      logInfo(`didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-24);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0227
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0227
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0227 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(97);
      logInfo(`step2 frameBegin(97): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(125);
      logInfo(`step3 frameBegin(125): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(80);
      logInfo(`step4 didScroll(80): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`scale>frameBegin>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0227 end`);
    });
  });
}
