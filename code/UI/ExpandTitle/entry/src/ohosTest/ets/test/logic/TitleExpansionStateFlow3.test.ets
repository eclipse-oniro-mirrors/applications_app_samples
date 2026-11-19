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

/** Logic checks for TitleExpansionState flow (55 cases). */
export default function titleExpansionStateFlow3Test(): void {
  describe('TitleExpansionStateFlow3Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0117
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0117
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0117 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(98.82);
      logInfo(`step1 frameBegin(98.82): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(-40);
      logInfo(`step2 didScroll(-40): step2=${step2}`);
      expect(step2).assertEqual(40);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`frameBegin>didScroll>opacity>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-40);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0118
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0118
     * @tc.desc      TitleExpansionState call flow scale > didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0118 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(46);
      logInfo(`step2 didScroll(46): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(40);
      logInfo(`step3 frameBegin(40): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`scale>didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(46);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0119
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0119
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0119 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(-45);
      logInfo(`step2 frameBegin(-45): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.0444444444444445, PRECISION);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertClose(1.0444444444444445, PRECISION);
      logInfo(`scale>frameBegin>scale>scale final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0120
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0120
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > scale > frameBegin > stop keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0120 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-68);
      logInfo(`step1 didScroll(-68): step1=${step1}`);
      expect(step1).assertEqual(68);
      const step2: number = subject.frameBegin(39.46);
      logInfo(`step2 frameBegin(39.46): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.1511111111111112, PRECISION);
      const step4: number = subject.frameBegin(-1);
      logInfo(`step4 frameBegin(-1): step4=${step4}`);
      expect(step4).assertEqual(81);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`didScroll>frameBegin>scale>frameBegin>sto...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-68);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0121
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0121
     * @tc.desc      TitleExpansionState call flow scale > stop > stop > stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0121 begin`);
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
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.frameBegin(43.41);
      logInfo(`step5 frameBegin(43.41): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0122
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0122
     * @tc.desc      TitleExpansionState call flow opacity > stop > didScroll > stop > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0122 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(190);
      logInfo(`step3 didScroll(190): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`opacity>stop>didScroll>stop>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(190);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0123
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0123
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0123 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(176);
      logInfo(`step1 didScroll(176): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(64.64);
      logInfo(`step2 frameBegin(64.64): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(176);
      logInfo(`step3 didScroll(176): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`didScroll>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(176);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0124
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0124
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll > scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0124 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(57.99);
      logInfo(`step1 didScroll(57.99): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(185);
      logInfo(`step2 didScroll(185): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`didScroll>didScroll>scale>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(185);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0125
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0125
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin > frameBegin > didScroll > opacity keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0125 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(140);
      logInfo(`step2 frameBegin(140): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(123);
      logInfo(`step3 frameBegin(123): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(-33);
      logInfo(`step4 didScroll(-33): step4=${step4}`);
      expect(step4).assertEqual(33);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`opacity>frameBegin>frameBegin>didScroll>o...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-33);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0126
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0126
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0126 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(180);
      logInfo(`step1 didScroll(180): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(37.9);
      logInfo(`step2 frameBegin(37.9): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`didScroll>frameBegin>scale>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(180);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0127
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0127
     * @tc.desc      TitleExpansionState call flow didScroll > stop > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0127 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-75);
      logInfo(`step1 didScroll(-75): step1=${step1}`);
      expect(step1).assertEqual(75);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.1666666666666665, PRECISION);
      logInfo(`didScroll>stop>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-75);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0128
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0128
     * @tc.desc      TitleExpansionState call flow stop > opacity > frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0128 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(30);
      logInfo(`step3 frameBegin(30): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(35.39);
      logInfo(`step4 frameBegin(35.39): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0129
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0129
     * @tc.desc      TitleExpansionState call flow opacity > stop > stop > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0129 begin`);
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
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0130
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0130
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0130 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(25);
      logInfo(`step1 frameBegin(25): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(50);
      logInfo(`step2 didScroll(50): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.stop();
      logInfo(`step3 stop(): step3=${step3}`);
      expect(step3).assertEqual(80);
      logInfo(`frameBegin>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(50);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0131
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0131
     * @tc.desc      TitleExpansionState call flow opacity > opacity > didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0131 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(10);
      logInfo(`step3 didScroll(10): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(131);
      logInfo(`step4 frameBegin(131): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`opacity>opacity>didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(10);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0132
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0132
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > frameBegin > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0132 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(3.07);
      logInfo(`step2 frameBegin(3.07): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(85);
      logInfo(`step3 frameBegin(85): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0133
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0133
     * @tc.desc      TitleExpansionState call flow opacity > scale > scale > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0133 begin`);
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
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0134
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0134
     * @tc.desc      TitleExpansionState call flow opacity > frameBegin > didScroll > stop > frameBegin keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0134 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(94.58);
      logInfo(`step2 frameBegin(94.58): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(45);
      logInfo(`step3 didScroll(45): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.frameBegin(40);
      logInfo(`step5 frameBegin(40): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`opacity>frameBegin>didScroll>stop>frameBe...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(45);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0135
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0135
     * @tc.desc      TitleExpansionState call flow scale > didScroll > didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0135 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(166);
      logInfo(`step2 didScroll(166): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(32.79);
      logInfo(`step3 didScroll(32.79): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`scale>didScroll>didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(32.79, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0136
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0136
     * @tc.desc      TitleExpansionState call flow stop > scale > stop > didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0136 begin`);
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
      const step4: number = subject.didScroll(90);
      logInfo(`step4 didScroll(90): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`stop>scale>stop>didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(90);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0137
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0137
     * @tc.desc      TitleExpansionState call flow stop > opacity > scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0137 begin`);
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
      const step4: number = subject.didScroll(193);
      logInfo(`step4 didScroll(193): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`stop>opacity>scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(193);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0138
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0138
     * @tc.desc      TitleExpansionState call flow stop > scale > stop > didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0138 begin`);
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
      const step4: number = subject.didScroll(18.27);
      logInfo(`step4 didScroll(18.27): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.frameBegin(40);
      logInfo(`step5 frameBegin(40): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`stop>scale>stop>didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(18.27, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0139
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0139
     * @tc.desc      TitleExpansionState call flow didScroll > stop > stop > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0139 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(30);
      logInfo(`step1 didScroll(30): step1=${step1}`);
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
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`didScroll>stop>stop>opacity>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(30);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0140
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0140
     * @tc.desc      TitleExpansionState call flow didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0140 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-100);
      logInfo(`step1 didScroll(-100): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0141
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0141
     * @tc.desc      TitleExpansionState call flow stop > stop > opacity > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0141 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0142
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0142
     * @tc.desc      TitleExpansionState call flow stop > scale > didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0142 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(113);
      logInfo(`step3 didScroll(113): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(50);
      logInfo(`step4 frameBegin(50): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`stop>scale>didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(113);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0143
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0143
     * @tc.desc      TitleExpansionState call flow stop > stop > stop > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0143 begin`);
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
      const step4: number = subject.didScroll(166);
      logInfo(`step4 didScroll(166): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`stop>stop>stop>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(166);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0144
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0144
     * @tc.desc      TitleExpansionState call flow opacity > stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0144 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.frameBegin(-83);
      logInfo(`step3 frameBegin(-83): step3=${step3}`);
      expect(step3).assertEqual(100);
      logInfo(`opacity>stop>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0145
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0145
     * @tc.desc      TitleExpansionState call flow frameBegin > opacity > scale > didScroll > frameBegin keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0145 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-70);
      logInfo(`step1 frameBegin(-70): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertClose(1.0444444444444445, PRECISION);
      const step4: number = subject.didScroll(-40);
      logInfo(`step4 didScroll(-40): step4=${step4}`);
      expect(step4).assertEqual(40);
      const step5: number = subject.frameBegin(192);
      logInfo(`step5 frameBegin(192): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`frameBegin>opacity>scale>didScroll>frameB...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-40);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0146
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0146
     * @tc.desc      TitleExpansionState call flow opacity > opacity > didScroll > stop > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0146 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(15);
      logInfo(`step3 didScroll(15): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`opacity>opacity>didScroll>stop>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(15);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0147
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0147
     * @tc.desc      TitleExpansionState call flow scale > didScroll > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0147 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.didScroll(35.07);
      logInfo(`step2 didScroll(35.07): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`scale>didScroll>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(35.07, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0148
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0148
     * @tc.desc      TitleExpansionState call flow stop > stop > opacity > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0148 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0149
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0149
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > opacity > stop > scale keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0149 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(190);
      logInfo(`step1 frameBegin(190): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(57.99);
      logInfo(`step2 didScroll(57.99): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`frameBegin>didScroll>opacity>stop>scale f...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(57.99, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0150
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0150
     * @tc.desc      TitleExpansionState call flow didScroll > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0150 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(-68);
      logInfo(`step1 didScroll(-68): step1=${step1}`);
      expect(step1).assertEqual(68);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.didScroll(177);
      logInfo(`step3 didScroll(177): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`didScroll>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(177);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0151
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0151
     * @tc.desc      TitleExpansionState call flow opacity > scale > opacity > opacity > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0151 begin`);
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
      const step5: number = subject.scale();
      logInfo(`step5 scale(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0152
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0152
     * @tc.desc      TitleExpansionState call flow opacity > scale > didScroll > stop > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0152 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(195);
      logInfo(`step3 didScroll(195): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.didScroll(135);
      logInfo(`step5 didScroll(135): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`opacity>scale>didScroll>stop>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(135);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0153
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0153
     * @tc.desc      TitleExpansionState call flow opacity > didScroll > frameBegin > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0153 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(170);
      logInfo(`step2 didScroll(170): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(30);
      logInfo(`step3 frameBegin(30): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.frameBegin(56);
      logInfo(`step4 frameBegin(56): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`opacity>didScroll>frameBegin>frameBegin f...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(170);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0154
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0154
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0154 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(160);
      logInfo(`step1 didScroll(160): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(-43);
      logInfo(`step2 frameBegin(-43): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`didScroll>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`didScroll>frameBegin final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(160);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0155
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0155
     * @tc.desc      TitleExpansionState call flow frameBegin > stop > didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0155 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(168);
      logInfo(`step1 frameBegin(168): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(-100);
      logInfo(`step3 didScroll(-100): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertClose(1.2, PRECISION);
      logInfo(`frameBegin>stop>didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0156
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0156
     * @tc.desc      TitleExpansionState call flow frameBegin > scale > didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0156 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-45);
      logInfo(`step1 frameBegin(-45): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertClose(1.0444444444444445, PRECISION);
      const step3: number = subject.didScroll(170);
      logInfo(`step3 didScroll(170): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertClose(1.0444444444444445, PRECISION);
      logInfo(`frameBegin>scale>didScroll>scale final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`frameBegin>scale>didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(170);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0157
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0157
     * @tc.desc      TitleExpansionState call flow opacity > opacity > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0157 begin`);
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
      const step4: number = subject.didScroll(75.55);
      logInfo(`step4 didScroll(75.55): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`opacity>opacity>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(75.55, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0158
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0158
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0158 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-38);
      logInfo(`step1 frameBegin(-38): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.didScroll(75);
      logInfo(`step2 didScroll(75): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`frameBegin>didScroll final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(75);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0159
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0159
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0159 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(-43);
      logInfo(`step2 frameBegin(-43): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.didScroll(40);
      logInfo(`step3 didScroll(40): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertClose(1.0444444444444445, PRECISION);
      logInfo(`stop>frameBegin>didScroll>scale final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`stop>frameBegin>didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(40);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0160
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0160
     * @tc.desc      TitleExpansionState call flow opacity > stop > stop > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0160 begin`);
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
      const step4: number = subject.frameBegin(58.74);
      logInfo(`step4 frameBegin(58.74): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0161
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0161
     * @tc.desc      TitleExpansionState call flow scale > scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0161 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(62);
      logInfo(`step3 didScroll(62): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`scale>scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(62);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0162
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0162
     * @tc.desc      TitleExpansionState call flow opacity > stop > opacity > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0162 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0163
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0163
     * @tc.desc      TitleExpansionState call flow stop > stop > stop > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0163 begin`);
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
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0164
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0164
     * @tc.desc      TitleExpansionState call flow didScroll > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0164 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(80);
      logInfo(`step1 didScroll(80): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`didScroll>scale final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0165
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0165
     * @tc.desc      TitleExpansionState call flow stop > opacity > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0165 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0166
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0166
     * @tc.desc      TitleExpansionState call flow opacity > scale > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0166 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.didScroll(57.99);
      logInfo(`step3 didScroll(57.99): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`opacity>scale>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(57.99, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0167
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0167
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > didScroll > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0167 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(12);
      logInfo(`step2 frameBegin(12): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.didScroll(100);
      logInfo(`step3 didScroll(100): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.didScroll(198);
      logInfo(`step4 didScroll(198): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`stop>frameBegin>didScroll>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(198);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0168
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0168
     * @tc.desc      TitleExpansionState call flow scale > frameBegin > scale > didScroll > frameBegin keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0168 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.frameBegin(126);
      logInfo(`step2 frameBegin(126): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.didScroll(16);
      logInfo(`step4 didScroll(16): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.frameBegin(58.74);
      logInfo(`step5 frameBegin(58.74): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`scale>frameBegin>scale>didScroll>frameBeg...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(16);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0169
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0169
     * @tc.desc      TitleExpansionState call flow didScroll > didScroll > opacity > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0169 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(2);
      logInfo(`step1 didScroll(2): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(-45);
      logInfo(`step2 didScroll(-45): step2=${step2}`);
      expect(step2).assertEqual(45);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.opacity();
      logInfo(`step4 opacity(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`didScroll>didScroll>opacity>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-45);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0170
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0170
     * @tc.desc      TitleExpansionState call flow opacity > opacity > stop > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0170 begin`);
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
      const step4: number = subject.stop();
      logInfo(`step4 stop(): step4=${step4}`);
      expect(step4).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0171
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0171
     * @tc.desc      TitleExpansionState call flow stop > didScroll > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0171 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(35.07);
      logInfo(`step2 didScroll(35.07): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.frameBegin(91);
      logInfo(`step3 frameBegin(91): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(37.27);
      logInfo(`step4 didScroll(37.27): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`stop>didScroll>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(37.27, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0171 end`);
    });
  });
}
