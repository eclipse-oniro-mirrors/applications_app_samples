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

/** Logic checks for TitleExpansionState flow (57 cases). */
export default function titleExpansionStateFlow2Test(): void {
  describe('TitleExpansionStateFlow2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0060
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0060
     * @tc.desc      TitleExpansionState call flow opacity > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0060 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0061
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0061
     * @tc.desc      TitleExpansionState call flow stop > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0061 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0062
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0062
     * @tc.desc      TitleExpansionState call flow stop > didScroll > opacity > frameBegin > opacity keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0062 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(-45);
      logInfo(`step2 didScroll(-45): step2=${step2}`);
      expect(step2).assertEqual(45);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(65);
      logInfo(`step4 frameBegin(65): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`stop>didScroll>opacity>frameBegin>opacity...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-45);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0063
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0063
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0063 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(192);
      logInfo(`step2 frameBegin(192): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(129);
      logInfo(`step3 frameBegin(129): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(65);
      logInfo(`step4 frameBegin(65): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0064
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0064
     * @tc.desc      TitleExpansionState call flow opacity > opacity > frameBegin > opacity > frameBegin keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0064 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(64.64);
      logInfo(`step3 frameBegin(64.64): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.frameBegin(66);
      logInfo(`step5 frameBegin(66): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0065
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0065
     * @tc.desc      TitleExpansionState call flow opacity > stop > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0065 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0066
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0066
     * @tc.desc      TitleExpansionState call flow didScroll > stop > scale > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0066 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(75);
      logInfo(`step1 didScroll(75): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`didScroll>stop>scale>scale>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(75);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0067
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0067
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > scale > scale > opacity keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0067 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(42.09);
      logInfo(`step1 didScroll(42.09): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(126);
      logInfo(`step2 frameBegin(126): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`didScroll>frameBegin>scale>scale>opacity ...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(42.09, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0068
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0068
     * @tc.desc      TitleExpansionState call flow opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0068 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(70.28);
      logInfo(`step2 didScroll(70.28): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(70.28, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0069
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0069
     * @tc.desc      TitleExpansionState call flow didScroll > stop > didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0069 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(167);
      logInfo(`step1 didScroll(167): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(185);
      logInfo(`step3 didScroll(185): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`didScroll>stop>didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(185);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0070
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0070
     * @tc.desc      TitleExpansionState call flow scale > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0070 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0071
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0071
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > didScroll > scale > didScroll keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0071 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-17);
      logInfo(`step1 frameBegin(-17): step1=${step1}`);
      expect(step1).assertEqual(97);
      const step2: number = subject.didScroll(175);
      logInfo(`step2 didScroll(175): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(185);
      logInfo(`step3 didScroll(185): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertClose(1.0377777777777777, PRECISION);
      const step5: number = subject.didScroll(3);
      logInfo(`step5 didScroll(3): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`frameBegin>didScroll>didScroll>scale>didS...: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(97);
      logInfo(`frameBegin>didScroll>didScroll>scale>didS...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(3);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0072
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0072
     * @tc.desc      TitleExpansionState call flow scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0072 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(84);
      logInfo(`step2 didScroll(84): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(84);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0073
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0073
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0073 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(93);
      logInfo(`step1 didScroll(93): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(173);
      logInfo(`step2 frameBegin(173): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`didScroll>frameBegin>scale>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(93);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0074
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0074
     * @tc.desc      TitleExpansionState call flow didScroll > scale > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0074 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(147);
      logInfo(`step1 didScroll(147): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(186);
      logInfo(`step3 frameBegin(186): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`didScroll>scale>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(147);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0075
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0075
     * @tc.desc      TitleExpansionState call flow scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0075 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(137);
      logInfo(`step2 didScroll(137): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(137);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0076
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0076
     * @tc.desc      TitleExpansionState call flow stop > didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0076 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(35.07);
      logInfo(`step2 didScroll(35.07): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(86.22);
      logInfo(`step3 frameBegin(86.22): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`stop>didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(35.07, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0077
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0077
     * @tc.desc      TitleExpansionState call flow stop > opacity > scale > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0077 begin`);
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
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0078
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0078
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0078 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(147);
      logInfo(`step1 didScroll(147): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(147);
      logInfo(`step3 didScroll(147): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`didScroll>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(147);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0079
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0079
     * @tc.desc      TitleExpansionState call flow scale > scale > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0079 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(155);
      logInfo(`step3 frameBegin(155): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0080
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0080
     * @tc.desc      TitleExpansionState call flow didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0080 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(90);
      logInfo(`step1 didScroll(90): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(90);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0081
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0081
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0081 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(66);
      logInfo(`step1 frameBegin(66): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(165);
      logInfo(`step2 didScroll(165): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(62);
      logInfo(`step3 didScroll(62): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`frameBegin>didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(62);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0082
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0082
     * @tc.desc      TitleExpansionState call flow didScroll > stop > scale > frameBegin > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0082 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(93.38);
      logInfo(`step1 didScroll(93.38): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.frameBegin(11);
      logInfo(`step4 frameBegin(11): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`didScroll>stop>scale>frameBegin>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(93.38, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0083
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0083
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > didScroll > didScroll > stop keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0083 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(97.75);
      logInfo(`step1 didScroll(97.75): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(-38);
      logInfo(`step2 frameBegin(-38): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.didScroll(-37);
      logInfo(`step3 didScroll(-37): step3=${step3}`);
      expect(step3).assertEqual(37);
      const step4: number = subject.didScroll(135);
      logInfo(`step4 didScroll(135): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`didScroll>frameBegin>didScroll>didScroll>...: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`didScroll>frameBegin>didScroll>didScroll>...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(135);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0084
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0084
     * @tc.desc      TitleExpansionState call flow frameBegin > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0084 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(90);
      logInfo(`step1 frameBegin(90): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(85);
      logInfo(`step2 frameBegin(85): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(51.13);
      logInfo(`step3 didScroll(51.13): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`frameBegin>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(51.13, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0085
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0085
     * @tc.desc      TitleExpansionState call flow opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0085 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0086
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0086
     * @tc.desc      TitleExpansionState call flow scale > didScroll > stop > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0086 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(84);
      logInfo(`step2 didScroll(84): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(145);
      logInfo(`step4 didScroll(145): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`scale>didScroll>stop>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(145);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0087
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0087
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > stop > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0087 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(195);
      logInfo(`step1 didScroll(195): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(145);
      logInfo(`step2 frameBegin(145): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`didScroll>frameBegin>stop>scale>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(195);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0088
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0088
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0088 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(150);
      logInfo(`step1 didScroll(150): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(65);
      logInfo(`step2 frameBegin(65): step2=${step2}`);
      expect(step2).assertEqual(80);
      logInfo(`didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(150);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0089
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0089
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > stop > stop > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0089 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(79);
      logInfo(`step1 frameBegin(79): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(1);
      logInfo(`step2 didScroll(1): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`frameBegin>didScroll>stop>stop>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0090
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0090
     * @tc.desc      TitleExpansionState call flow opacity > stop > scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0090 begin`);
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
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0091
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0091
     * @tc.desc      TitleExpansionState call flow frameBegin > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0091 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-17);
      logInfo(`step1 frameBegin(-17): step1=${step1}`);
      expect(step1).assertEqual(97);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertClose(0.85, PRECISION);
      logInfo(`frameBegin>opacity final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(97);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0092
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0092
     * @tc.desc      TitleExpansionState call flow scale > scale > scale > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0092 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.frameBegin(94);
      logInfo(`step4 frameBegin(94): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0093
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0093
     * @tc.desc      TitleExpansionState call flow didScroll > scale > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0093 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-75);
      logInfo(`step1 didScroll(-75): step1=${step1}`);
      expect(step1).assertEqual(75);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertClose(1.1666666666666665, PRECISION);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.1666666666666665, PRECISION);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertClose(1.1666666666666665, PRECISION);
      logInfo(`didScroll>scale>scale>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-75);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0094
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0094
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0094 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(147);
      logInfo(`step1 didScroll(147): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(-32);
      logInfo(`step2 didScroll(-32): step2=${step2}`);
      expect(step2).assertEqual(32);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`didScroll>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-32);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0095
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0095
     * @tc.desc      TitleExpansionState call flow didScroll > stop > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0095 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(20);
      logInfo(`step1 didScroll(20): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(84);
      logInfo(`step3 didScroll(84): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`didScroll>stop>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(84);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0096
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0096
     * @tc.desc      TitleExpansionState call flow didScroll > stop > stop > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0096 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(7.58);
      logInfo(`step1 didScroll(7.58): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`didScroll>stop>stop>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(7.58, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0097
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0097
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin > opacity > scale > opacity keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0097 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(187);
      logInfo(`step2 frameBegin(187): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0098
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0098
     * @tc.desc      TitleExpansionState call flow frameBegin > scale > scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0098 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(190);
      logInfo(`step1 frameBegin(190): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.didScroll(-32);
      logInfo(`step4 didScroll(-32): step4=${step4}`);
      expect(step4).assertEqual(32);
      logInfo(`frameBegin>scale>scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-32);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0099
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0099
     * @tc.desc      TitleExpansionState call flow didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0099 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(98);
      logInfo(`step1 didScroll(98): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(98);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0100
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0100
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0100 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(110);
      logInfo(`step1 didScroll(110): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(147);
      logInfo(`step2 didScroll(147): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(147);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0101
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0101
     * @tc.desc      TitleExpansionState call flow scale > opacity > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0101 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0102
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0102
     * @tc.desc      TitleExpansionState call flow scale > didScroll > stop > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0102 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(30);
      logInfo(`step2 didScroll(30): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`scale>didScroll>stop>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(30);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0103
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0103
     * @tc.desc      TitleExpansionState call flow frameBegin > scale > didScroll > frameBegin > opacity keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0103 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(34.3);
      logInfo(`step1 frameBegin(34.3): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(198);
      logInfo(`step3 didScroll(198): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(160);
      logInfo(`step4 frameBegin(160): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`frameBegin>scale>didScroll>frameBegin>opa...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(198);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0104
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0104
     * @tc.desc      TitleExpansionState call flow opacity > scale > opacity > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0104 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0105
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0105
     * @tc.desc      TitleExpansionState call flow opacity > scale > scale > frameBegin > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0105 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.frameBegin(-38);
      logInfo(`step4 frameBegin(-38): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertClose(1.0444444444444445, PRECISION);
      logInfo(`opacity>scale>scale>frameBegin>scale final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0106
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0106
     * @tc.desc      TitleExpansionState call flow opacity > didScroll > didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0106 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(155);
      logInfo(`step2 didScroll(155): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(1);
      logInfo(`step3 didScroll(1): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.didScroll(-1);
      logInfo(`step4 didScroll(-1): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`opacity>didScroll>didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0107
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0107
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0107 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(173);
      logInfo(`step1 frameBegin(173): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(57.99);
      logInfo(`step2 didScroll(57.99): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(57.99, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0108
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0108
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0108 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(140);
      logInfo(`step2 frameBegin(140): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(41.94);
      logInfo(`step3 didScroll(41.94): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`stop>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(41.94, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0109
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0109
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > didScroll > opacity > scale keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0109 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(125);
      logInfo(`step1 didScroll(125): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(93);
      logInfo(`step3 didScroll(93): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`didScroll>opacity>didScroll>opacity>scale...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(93);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0110
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0110
     * @tc.desc      TitleExpansionState call flow scale > stop > opacity > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0110 begin`);
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
      const step4: number = subject.frameBegin(-62);
      logInfo(`step4 frameBegin(-62): step4=${step4}`);
      expect(step4).assertEqual(100);
      logInfo(`scale>stop>opacity>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0111
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0111
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > stop > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0111 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(18.27);
      logInfo(`step1 didScroll(18.27): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`didScroll>opacity>stop>opacity>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(18.27, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0112
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0112
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0112 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(192);
      logInfo(`step1 didScroll(192): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(-23);
      logInfo(`step2 frameBegin(-23): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`didScroll>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(192);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0113
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0113
     * @tc.desc      TitleExpansionState call flow stop > opacity > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0113 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(40.89);
      logInfo(`step3 frameBegin(40.89): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(-100);
      logInfo(`step4 didScroll(-100): step4=${step4}`);
      expect(step4).assertEqual(100);
      logInfo(`stop>opacity>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0114
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0114
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0114 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(195);
      logInfo(`step1 frameBegin(195): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(-40);
      logInfo(`step2 didScroll(-40): step2=${step2}`);
      expect(step2).assertEqual(40);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`frameBegin>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-40);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0115
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0115
     * @tc.desc      TitleExpansionState call flow scale > didScroll > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0115 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(32.79);
      logInfo(`step2 didScroll(32.79): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.didScroll(159);
      logInfo(`step4 didScroll(159): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`scale>didScroll>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(159);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0116
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0116
     * @tc.desc      TitleExpansionState call flow stop > opacity > scale > frameBegin > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0116 begin`);
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
      const step4: number = subject.frameBegin(-24);
      logInfo(`step4 frameBegin(-24): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`stop>opacity>scale>frameBegin>opacity final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0116 end`);
    });
  });
}
