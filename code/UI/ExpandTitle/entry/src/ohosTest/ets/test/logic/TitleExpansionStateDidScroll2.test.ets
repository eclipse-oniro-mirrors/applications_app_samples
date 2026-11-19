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

/** Logic checks for TitleExpansionState.didScroll (39 cases). */
export default function titleExpansionStateDidScroll2Test(): void {
  describe('TitleExpansionStateDidScroll2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0082
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0082
     * @tc.desc      TitleExpansionState.didScroll(yOffset=193) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0082 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(193);
      logInfo(`didScroll(yOffset=193): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=193) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(193);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0083
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0083
     * @tc.desc      TitleExpansionState.didScroll(yOffset=107) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0083 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(107);
      logInfo(`didScroll(yOffset=107): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=107) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(107);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0084
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0084
     * @tc.desc      TitleExpansionState.didScroll(yOffset=167) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0084 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(167);
      logInfo(`didScroll(yOffset=167): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=167) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(167);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0085
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0085
     * @tc.desc      TitleExpansionState.didScroll(yOffset=166) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0085 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(166);
      logInfo(`didScroll(yOffset=166): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=166) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(166);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0086
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0086
     * @tc.desc      TitleExpansionState.didScroll(yOffset=35.07) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0086 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(35.07);
      logInfo(`didScroll(yOffset=35.07): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=35.07) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(35.07, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0087
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0087
     * @tc.desc      TitleExpansionState.didScroll(yOffset=18.27) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0087 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(18.27);
      logInfo(`didScroll(yOffset=18.27): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=18.27) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(18.27, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0088
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0088
     * @tc.desc      TitleExpansionState.didScroll(yOffset=97.75) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0088 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(97.75);
      logInfo(`didScroll(yOffset=97.75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=97.75) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(97.75, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0089
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0089
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-75) yields 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0089 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-75);
      logInfo(`didScroll(yOffset=-75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`didScroll(yOffset=-75) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-75);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0090
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0090
     * @tc.desc      TitleExpansionState.didScroll(yOffset=97.38) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0090 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(97.38);
      logInfo(`didScroll(yOffset=97.38): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=97.38) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(97.38, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0091
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0091
     * @tc.desc      TitleExpansionState.didScroll(yOffset=177) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0091 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(177);
      logInfo(`didScroll(yOffset=177): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=177) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(177);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0092
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0092
     * @tc.desc      TitleExpansionState.didScroll(yOffset=192) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0092 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(192);
      logInfo(`didScroll(yOffset=192): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=192) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(192);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0093
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0093
     * @tc.desc      TitleExpansionState.didScroll(yOffset=114) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0093 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(114);
      logInfo(`didScroll(yOffset=114): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=114) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(114);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0094
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0094
     * @tc.desc      TitleExpansionState.didScroll(yOffset=7.58) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0094 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(7.58);
      logInfo(`didScroll(yOffset=7.58): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=7.58) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(7.58, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0095
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0095
     * @tc.desc      TitleExpansionState.didScroll(yOffset=174) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0095 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(174);
      logInfo(`didScroll(yOffset=174): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=174) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(174);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0096
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0096
     * @tc.desc      TitleExpansionState.didScroll(yOffset=199) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0096 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(199);
      logInfo(`didScroll(yOffset=199): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=199) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(199);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0096 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0097
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0097
     * @tc.desc      TitleExpansionState.didScroll(yOffset=5.63) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0097 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(5.63);
      logInfo(`didScroll(yOffset=5.63): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=5.63) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(5.63, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0098
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0098
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-61) yields 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0098 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-61);
      logInfo(`didScroll(yOffset=-61): actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`didScroll(yOffset=-61) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-61);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0099
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0099
     * @tc.desc      TitleExpansionState.didScroll(yOffset=42.14) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0099 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(42.14);
      logInfo(`didScroll(yOffset=42.14): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=42.14) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(42.14, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0100
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0100
     * @tc.desc      TitleExpansionState.didScroll(yOffset=42.09) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0100 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(42.09);
      logInfo(`didScroll(yOffset=42.09): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=42.09) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(42.09, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0101
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0101
     * @tc.desc      TitleExpansionState.didScroll(yOffset=58) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0101 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(58);
      logInfo(`didScroll(yOffset=58): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=58) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(58);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0102
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0102
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-80) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0102 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-80);
      logInfo(`didScroll(yOffset=-80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`didScroll(yOffset=-80) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-80);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0103
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0103
     * @tc.desc      TitleExpansionState.didScroll(yOffset=176) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0103 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(176);
      logInfo(`didScroll(yOffset=176): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=176) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(176);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0104
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0104
     * @tc.desc      TitleExpansionState.didScroll(yOffset=132) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0104 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(132);
      logInfo(`didScroll(yOffset=132): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=132) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(132);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0105
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0105
     * @tc.desc      TitleExpansionState.didScroll(yOffset=159) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0105 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(159);
      logInfo(`didScroll(yOffset=159): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=159) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(159);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0106
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0106
     * @tc.desc      TitleExpansionState.didScroll(yOffset=73.82) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0106 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(73.82);
      logInfo(`didScroll(yOffset=73.82): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=73.82) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(73.82, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0107
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0107
     * @tc.desc      TitleExpansionState.didScroll(yOffset=16) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0107 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(16);
      logInfo(`didScroll(yOffset=16): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=16) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(16);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0108
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0108
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-24) yields 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0108 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-24);
      logInfo(`didScroll(yOffset=-24): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`didScroll(yOffset=-24) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-24);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0109
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0109
     * @tc.desc      TitleExpansionState.didScroll(yOffset=81.15) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0109 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(81.15);
      logInfo(`didScroll(yOffset=81.15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=81.15) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(81.15, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0110
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0110
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0110 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-10);
      logInfo(`didScroll(yOffset=-10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`didScroll(yOffset=-10) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-10);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0111
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0111
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-32) yields 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0111 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-32);
      logInfo(`didScroll(yOffset=-32): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`didScroll(yOffset=-32) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-32);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0112
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0112
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-40) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0112 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-40);
      logInfo(`didScroll(yOffset=-40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`didScroll(yOffset=-40) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-40);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0113
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0113
     * @tc.desc      TitleExpansionState.didScroll(yOffset=62) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0113 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(62);
      logInfo(`didScroll(yOffset=62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=62) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(62);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0114
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0114
     * @tc.desc      TitleExpansionState.didScroll(yOffset=91) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0114 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(91);
      logInfo(`didScroll(yOffset=91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=91) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(91);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0115
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0115
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-33) yields 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0115 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-33);
      logInfo(`didScroll(yOffset=-33): actual=${actual}`);
      expect(actual).assertEqual(33);
      logInfo(`didScroll(yOffset=-33) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-33);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0116
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0116
     * @tc.desc      TitleExpansionState.didScroll(yOffset=76.68) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0116 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(76.68);
      logInfo(`didScroll(yOffset=76.68): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=76.68) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(76.68, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0117
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0117
     * @tc.desc      TitleExpansionState.didScroll(yOffset=113) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0117 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(113);
      logInfo(`didScroll(yOffset=113): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=113) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(113);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0118
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0118
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-68) yields 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0118 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-68);
      logInfo(`didScroll(yOffset=-68): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`didScroll(yOffset=-68) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-68);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0119
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0119
     * @tc.desc      TitleExpansionState.didScroll(yOffset=41.94) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0119 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(41.94);
      logInfo(`didScroll(yOffset=41.94): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=41.94) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(41.94, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0120
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0120
     * @tc.desc      TitleExpansionState.didScroll(yOffset=183) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0120 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(183);
      logInfo(`didScroll(yOffset=183): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=183) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(183);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0120 end`);
    });
  });
}
