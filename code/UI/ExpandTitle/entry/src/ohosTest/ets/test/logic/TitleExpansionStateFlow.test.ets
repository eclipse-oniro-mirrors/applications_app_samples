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

/** Logic checks for TitleExpansionState flow (59 cases). */
export default function titleExpansionStateFlowTest(): void {
  describe('TitleExpansionStateFlowTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0001
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0001
     * @tc.desc      TitleExpansionState call flow didScroll > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleExpansionStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0001 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(110);
      logInfo(`step1 didScroll(110): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`didScroll>scale>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(110);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0002
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0002
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleExpansionStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0002 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(12);
      logInfo(`step2 frameBegin(12): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0003
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0003
     * @tc.desc      TitleExpansionState call flow opacity > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0003 begin`);
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
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0004
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0004
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0004 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(167);
      logInfo(`step1 didScroll(167): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(35.07);
      logInfo(`step2 didScroll(35.07): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(35.07, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0005
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0005
     * @tc.desc      TitleExpansionState call flow stop > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0005 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(-61);
      logInfo(`step2 didScroll(-61): step2=${step2}`);
      expect(step2).assertEqual(61);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`stop>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-61);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0006
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0006
     * @tc.desc      TitleExpansionState call flow didScroll > scale > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0006 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(113);
      logInfo(`step1 didScroll(113): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.didScroll(72);
      logInfo(`step4 didScroll(72): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`didScroll>scale>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(72);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0007
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0007
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0007 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(51.19);
      logInfo(`step2 frameBegin(51.19): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(-79);
      logInfo(`step3 frameBegin(-79): step3=${step3}`);
      expect(step3).assertEqual(100);
      logInfo(`stop>frameBegin>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0008
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0008
     * @tc.desc      TitleExpansionState call flow didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0008 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(147);
      logInfo(`step1 didScroll(147): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(147);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0009
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0009
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > frameBegin > opacity > scale keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0009 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(35);
      logInfo(`step1 didScroll(35): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(5);
      logInfo(`step2 frameBegin(5): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(94);
      logInfo(`step3 frameBegin(94): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`didScroll>frameBegin>frameBegin>opacity>s...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(35);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0010
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0010
     * @tc.desc      TitleExpansionState call flow frameBegin > scale > frameBegin > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0010 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(39.46);
      logInfo(`step1 frameBegin(39.46): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(151);
      logInfo(`step3 frameBegin(151): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0011
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0011
     * @tc.desc      TitleExpansionState call flow stop > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0011 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0012
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0012
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > opacity > frameBegin > scale keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0012 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(25);
      logInfo(`step1 didScroll(25): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(181);
      logInfo(`step4 frameBegin(181): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`didScroll>opacity>opacity>frameBegin>scal...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(25);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0013
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0013
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0013 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(2);
      logInfo(`step1 didScroll(2): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(155);
      logInfo(`step3 didScroll(155): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.didScroll(97.75);
      logInfo(`step4 didScroll(97.75): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`didScroll>opacity>didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(97.75, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0014
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0014
     * @tc.desc      TitleExpansionState call flow stop > scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0014 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(105);
      logInfo(`step3 didScroll(105): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`stop>scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(105);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0015
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0015
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0015 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(93);
      logInfo(`step1 didScroll(93): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(-10);
      logInfo(`step2 didScroll(-10): step2=${step2}`);
      expect(step2).assertEqual(10);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`didScroll>didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-10);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0016
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0016
     * @tc.desc      TitleExpansionState call flow didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0016 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(176);
      logInfo(`step1 didScroll(176): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(176);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0017
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0017
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll > scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0017 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(167);
      logInfo(`step1 didScroll(167): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(42.09);
      logInfo(`step2 didScroll(42.09): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`didScroll>didScroll>scale>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(42.09, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0018
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0018
     * @tc.desc      TitleExpansionState call flow opacity > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0018 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(2);
      logInfo(`step2 didScroll(2): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`opacity>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(2);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0019
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0019
     * @tc.desc      TitleExpansionState call flow opacity > stop > frameBegin > opacity > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0019 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(97);
      logInfo(`step3 frameBegin(97): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0020
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0020
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0020 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(45);
      logInfo(`step2 frameBegin(45): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0021
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0021
     * @tc.desc      TitleExpansionState call flow frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0021 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-1);
      logInfo(`step1 frameBegin(-1): step1=${step1}`);
      expect(step1).assertEqual(81);
      const step2: number = subject.frameBegin(-69);
      logInfo(`step2 frameBegin(-69): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`frameBegin>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0022
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0022
     * @tc.desc      TitleExpansionState call flow scale > stop > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0022 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0023
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0023
     * @tc.desc      TitleExpansionState call flow opacity > scale > frameBegin > frameBegin > scale keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0023 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(-19);
      logInfo(`step3 frameBegin(-19): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: number = subject.frameBegin(40.89);
      logInfo(`step4 frameBegin(40.89): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0024
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0024
     * @tc.desc      TitleExpansionState call flow stop > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0024 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(113);
      logInfo(`step2 didScroll(113): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`stop>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(113);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0025
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0025
     * @tc.desc      TitleExpansionState call flow scale > didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0025 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(2);
      logInfo(`step2 didScroll(2): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(65.78);
      logInfo(`step3 didScroll(65.78): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`scale>didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(65.78, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0026
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0026
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0026 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(-70);
      logInfo(`step2 frameBegin(-70): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`opacity>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0027
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0027
     * @tc.desc      TitleExpansionState call flow frameBegin > frameBegin > frameBegin > opacity > opacity keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0027 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(100);
      logInfo(`step1 frameBegin(100): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(195);
      logInfo(`step2 frameBegin(195): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(190);
      logInfo(`step3 frameBegin(190): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0028
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0028
     * @tc.desc      TitleExpansionState call flow stop > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0028 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0029
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0029
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > frameBegin > opacity > stop keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0029 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(168);
      logInfo(`step2 frameBegin(168): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(125);
      logInfo(`step3 frameBegin(125): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0030
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0030
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0030 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(143);
      logInfo(`step1 didScroll(143): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(180);
      logInfo(`step2 didScroll(180): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`didScroll>didScroll>opacity>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(180);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0031
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0031
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0031 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(71.59);
      logInfo(`step1 frameBegin(71.59): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(62);
      logInfo(`step2 didScroll(62): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.didScroll(190);
      logInfo(`step4 didScroll(190): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`frameBegin>didScroll>scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(190);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0032
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0032
     * @tc.desc      TitleExpansionState call flow opacity > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0032 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0033
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0033
     * @tc.desc      TitleExpansionState call flow didScroll > stop > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0033 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(176);
      logInfo(`step1 didScroll(176): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(40);
      logInfo(`step3 frameBegin(40): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(16);
      logInfo(`step4 didScroll(16): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`didScroll>stop>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(16);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0034
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0034
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll > opacity > frameBegin > scale keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0034 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(17);
      logInfo(`step1 didScroll(17): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(160);
      logInfo(`step2 didScroll(160): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(-49);
      logInfo(`step4 frameBegin(-49): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertClose(1.0444444444444445, PRECISION);
      logInfo(`didScroll>didScroll>opacity>frameBegin>sc...: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`didScroll>didScroll>opacity>frameBegin>sc...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(160);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0035
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0035
     * @tc.desc      TitleExpansionState call flow stop > didScroll > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0035 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(174);
      logInfo(`step2 didScroll(174): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(174);
      logInfo(`step3 didScroll(174): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`stop>didScroll>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(174);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0036
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0036
     * @tc.desc      TitleExpansionState call flow scale > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0036 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(17);
      logInfo(`step3 didScroll(17): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`scale>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(17);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0037
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0037
     * @tc.desc      TitleExpansionState call flow scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0037 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0038
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0038
     * @tc.desc      TitleExpansionState call flow scale > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0038 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(57.99);
      logInfo(`step3 didScroll(57.99): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`scale>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(57.99, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0039
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0039
     * @tc.desc      TitleExpansionState call flow stop > scale > didScroll > didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0039 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(132);
      logInfo(`step3 didScroll(132): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.didScroll(147);
      logInfo(`step4 didScroll(147): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`stop>scale>didScroll>didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(147);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0040
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0040
     * @tc.desc      TitleExpansionState call flow stop > scale > stop > frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0040 begin`);
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
      const step4: number = subject.frameBegin(136);
      logInfo(`step4 frameBegin(136): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.frameBegin(40.89);
      logInfo(`step5 frameBegin(40.89): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0041
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0041
     * @tc.desc      TitleExpansionState call flow frameBegin > opacity > scale > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0041 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-65);
      logInfo(`step1 frameBegin(-65): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.0444444444444445, PRECISION);
      const step4: number = subject.frameBegin(140);
      logInfo(`step4 frameBegin(140): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0042
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0042
     * @tc.desc      TitleExpansionState call flow opacity > stop > stop > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0042 begin`);
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
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0043
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0043
     * @tc.desc      TitleExpansionState call flow opacity > stop > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0043 begin`);
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
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0044
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0044
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > scale > didScroll > opacity keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0044 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(67.78);
      logInfo(`step2 frameBegin(67.78): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.didScroll(72);
      logInfo(`step4 didScroll(72): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`scale>frameBegin>scale>didScroll>opacity ...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(72);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0045
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0045
     * @tc.desc      TitleExpansionState call flow frameBegin > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0045 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(56);
      logInfo(`step1 frameBegin(56): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0046
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0046
     * @tc.desc      TitleExpansionState call flow scale > scale > frameBegin > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0046 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(37.9);
      logInfo(`step3 frameBegin(37.9): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0047
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0047
     * @tc.desc      TitleExpansionState call flow stop > opacity > scale > stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0047 begin`);
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
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.frameBegin(-99);
      logInfo(`step5 frameBegin(-99): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`stop>opacity>scale>stop>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0048
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0048
     * @tc.desc      TitleExpansionState call flow opacity > didScroll > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0048 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(155);
      logInfo(`step2 didScroll(155): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`opacity>didScroll>opacity>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(155);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0049
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0049
     * @tc.desc      TitleExpansionState call flow scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0049 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0050
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0050
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0050 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(170);
      logInfo(`step2 frameBegin(170): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0051
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0051
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > stop > frameBegin > didScroll keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0051 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(100);
      logInfo(`step2 frameBegin(100): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(12);
      logInfo(`step4 frameBegin(12): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.didScroll(147);
      logInfo(`step5 didScroll(147): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`scale>frameBegin>stop>frameBegin>didScrol...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(147);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0052
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0052
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0052 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(-24);
      logInfo(`step2 frameBegin(-24): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.frameBegin(129);
      logInfo(`step3 frameBegin(129): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0053
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0053
     * @tc.desc      TitleExpansionState call flow scale > didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0053 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(42.14);
      logInfo(`step2 didScroll(42.14): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(65);
      logInfo(`step3 frameBegin(65): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`scale>didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(42.14, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0054
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0054
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin > stop > scale > didScroll keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0054 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(10);
      logInfo(`step2 frameBegin(10): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.didScroll(166);
      logInfo(`step5 didScroll(166): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`opacity>frameBegin>stop>scale>didScroll f...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(166);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0055
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0055
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > frameBegin > opacity > frameBegin keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0055 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(60);
      logInfo(`step1 frameBegin(60): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(45);
      logInfo(`step2 didScroll(45): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(-45);
      logInfo(`step3 frameBegin(-45): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.frameBegin(67.78);
      logInfo(`step5 frameBegin(67.78): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`frameBegin>didScroll>frameBegin>opacity>f...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(45);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0056
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0056
     * @tc.desc      TitleExpansionState call flow stop > scale > opacity > scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0056 begin`);
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
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0057
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0057
     * @tc.desc      TitleExpansionState call flow stop > stop > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0057 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0058
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0058
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0058 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(3);
      logInfo(`step1 frameBegin(3): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(135);
      logInfo(`step2 didScroll(135): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`frameBegin>didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(135);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0059
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0059
     * @tc.desc      TitleExpansionState call flow frameBegin > frameBegin > stop > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0059 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(181);
      logInfo(`step1 frameBegin(181): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(5);
      logInfo(`step2 frameBegin(5): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0059 end`);
    });
  });
}
