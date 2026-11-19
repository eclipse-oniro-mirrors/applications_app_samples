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

/** Logic checks for TitleExpansionState flow (15 cases). */
export default function titleExpansionStateFlow5Test(): void {
  describe('TitleExpansionStateFlow5Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0228
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0228
     * @tc.desc      TitleExpansionState call flow stop > opacity > scale > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0228 begin`);
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
      const step4: number = subject.didScroll(148);
      logInfo(`step4 didScroll(148): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`stop>opacity>scale>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(148);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0229
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0229
     * @tc.desc      TitleExpansionState call flow frameBegin > didScroll > opacity > scale > frameBegin keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0229 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(172);
      logInfo(`step1 frameBegin(172): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(155);
      logInfo(`step2 didScroll(155): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.frameBegin(56);
      logInfo(`step5 frameBegin(56): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`frameBegin>didScroll>opacity>scale>frameB...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(155);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0230
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0230
     * @tc.desc      TitleExpansionState call flow stop > scale > stop > scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0230 begin`);
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
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0231
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0231
     * @tc.desc      TitleExpansionState call flow didScroll > frameBegin > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0231 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.didScroll(10);
      logInfo(`step1 didScroll(10): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.frameBegin(151);
      logInfo(`step2 frameBegin(151): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`didScroll>frameBegin>opacity final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(10);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0232
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0232
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > scale > scale > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0232 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(187);
      logInfo(`step2 frameBegin(187): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.scale();
      logInfo(`step3 scale(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0233
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0233
     * @tc.desc      TitleExpansionState call flow scale > opacity > opacity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0233 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.scale();
      logInfo(`step1 scale(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.opacity();
      logInfo(`step2 opacity(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0234
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0234
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > opacity > frameBegin > opacity keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0234 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(18.95);
      logInfo(`step2 frameBegin(18.95): step2=${step2}`);
      expect(step2).assertEqual(80);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(-62);
      logInfo(`step4 frameBegin(-62): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`stop>frameBegin>opacity>frameBegin>opacit...: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0235
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0235
     * @tc.desc      TitleExpansionState call flow opacity > didScroll > opacity > frameBegin > opacity keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0235 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.didScroll(55.84);
      logInfo(`step2 didScroll(55.84): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.frameBegin(98.82);
      logInfo(`step4 frameBegin(98.82): step4=${step4}`);
      expect(step4).assertEqual(80);
      const step5: number = subject.opacity();
      logInfo(`step5 opacity(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`opacity>didScroll>opacity>frameBegin>opac...: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(55.84, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0236
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0236
     * @tc.desc      TitleExpansionState call flow opacity > opacity > scale > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0236 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.opacity();
      logInfo(`step1 opacity(): step1=${step1}`);
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
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0237
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0237
     * @tc.desc      TitleExpansionState call flow scale > scale > opacity > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0237 begin`);
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
      const step4: number = subject.didScroll(75.55);
      logInfo(`step4 didScroll(75.55): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`scale>scale>opacity>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(75.55, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0238
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0238
     * @tc.desc      TitleExpansionState call flow frameBegin > stop > opacity > didScroll > stop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0238 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(-65);
      logInfo(`step1 frameBegin(-65): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.stop();
      logInfo(`step2 stop(): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.opacity();
      logInfo(`step3 opacity(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.didScroll(122);
      logInfo(`step4 didScroll(122): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.stop();
      logInfo(`step5 stop(): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`frameBegin>stop>opacity>didScroll>stop final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`frameBegin>stop>opacity>didScroll>stop final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(122);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0239
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0239
     * @tc.desc      TitleExpansionState call flow stop > frameBegin > frameBegin > scale keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0239 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.frameBegin(-2);
      logInfo(`step2 frameBegin(-2): step2=${step2}`);
      expect(step2).assertEqual(82);
      const step3: number = subject.frameBegin(200);
      logInfo(`step3 frameBegin(200): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.scale();
      logInfo(`step4 scale(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0240
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0240
     * @tc.desc      TitleExpansionState call flow frameBegin > scale > frameBegin > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0240 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(45);
      logInfo(`step1 frameBegin(45): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(155);
      logInfo(`step3 frameBegin(155): step3=${step3}`);
      expect(step3).assertEqual(80);
      const step4: number = subject.didScroll(40);
      logInfo(`step4 didScroll(40): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`frameBegin>scale>frameBegin>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(40);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0241
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0241
     * @tc.desc      TitleExpansionState call flow frameBegin > scale > frameBegin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0241 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.frameBegin(144);
      logInfo(`step1 frameBegin(144): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.scale();
      logInfo(`step2 scale(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.frameBegin(-83);
      logInfo(`step3 frameBegin(-83): step3=${step3}`);
      expect(step3).assertEqual(100);
      logInfo(`frameBegin>scale>frameBegin final: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FLOW_0242
     * @tc.name      ExpandTitle_TitleExpansionStateFlow_0242
     * @tc.desc      TitleExpansionState call flow stop > didScroll keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0242 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const step1: number = subject.stop();
      logInfo(`step1 stop(): step1=${step1}`);
      expect(step1).assertEqual(80);
      const step2: number = subject.didScroll(174);
      logInfo(`step2 didScroll(174): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`stop>didScroll final: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(174);
      logInfo(`${BUNDLE}TitleExpansionStateFlow_0242 end`);
    });
  });
}
