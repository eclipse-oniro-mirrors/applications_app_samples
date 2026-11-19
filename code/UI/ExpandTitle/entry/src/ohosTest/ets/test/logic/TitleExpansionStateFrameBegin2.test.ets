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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for TitleExpansionState.frameBegin (32 cases). */
export default function titleExpansionStateFrameBegin2Test(): void {
  describe('TitleExpansionStateFrameBegin2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0089
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0089
     * @tc.desc      TitleExpansionState.frameBegin(offset=-70) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0089 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-70);
      logInfo(`frameBegin(offset=-70): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-70) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0090
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0090
     * @tc.desc      TitleExpansionState.frameBegin(offset=18.33) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0090 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(18.33);
      logInfo(`frameBegin(offset=18.33): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0091
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0091
     * @tc.desc      TitleExpansionState.frameBegin(offset=94.58) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0091 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(94.58);
      logInfo(`frameBegin(offset=94.58): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0092
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0092
     * @tc.desc      TitleExpansionState.frameBegin(offset=134) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0092 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(134);
      logInfo(`frameBegin(offset=134): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0093
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0093
     * @tc.desc      TitleExpansionState.frameBegin(offset=3.07) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0093 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(3.07);
      logInfo(`frameBegin(offset=3.07): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0094
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0094
     * @tc.desc      TitleExpansionState.frameBegin(offset=168) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0094 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(168);
      logInfo(`frameBegin(offset=168): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0095
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0095
     * @tc.desc      TitleExpansionState.frameBegin(offset=58.74) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0095 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(58.74);
      logInfo(`frameBegin(offset=58.74): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0096
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0096
     * @tc.desc      TitleExpansionState.frameBegin(offset=98.82) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0096 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(98.82);
      logInfo(`frameBegin(offset=98.82): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0096 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0097
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0097
     * @tc.desc      TitleExpansionState.frameBegin(offset=79.03) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0097 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(79.03);
      logInfo(`frameBegin(offset=79.03): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0098
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0098
     * @tc.desc      TitleExpansionState.frameBegin(offset=-24) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0098 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-24);
      logInfo(`frameBegin(offset=-24): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-24) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0099
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0099
     * @tc.desc      TitleExpansionState.frameBegin(offset=67.78) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0099 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(67.78);
      logInfo(`frameBegin(offset=67.78): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0100
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0100
     * @tc.desc      TitleExpansionState.frameBegin(offset=-38) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0100 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-38);
      logInfo(`frameBegin(offset=-38): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-38) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0101
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0101
     * @tc.desc      TitleExpansionState.frameBegin(offset=22) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0101 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(22);
      logInfo(`frameBegin(offset=22): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0102
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0102
     * @tc.desc      TitleExpansionState.frameBegin(offset=-99) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0102 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-99);
      logInfo(`frameBegin(offset=-99): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-99) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0103
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0103
     * @tc.desc      TitleExpansionState.frameBegin(offset=11) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0103 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(11);
      logInfo(`frameBegin(offset=11): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0104
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0104
     * @tc.desc      TitleExpansionState.frameBegin(offset=-62) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0104 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-62);
      logInfo(`frameBegin(offset=-62): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-62) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0105
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0105
     * @tc.desc      TitleExpansionState.frameBegin(offset=187) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0105 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(187);
      logInfo(`frameBegin(offset=187): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0106
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0106
     * @tc.desc      TitleExpansionState.frameBegin(offset=-49) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0106 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-49);
      logInfo(`frameBegin(offset=-49): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-49) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0107
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0107
     * @tc.desc      TitleExpansionState.frameBegin(offset=86.22) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0107 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(86.22);
      logInfo(`frameBegin(offset=86.22): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0108
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0108
     * @tc.desc      TitleExpansionState.frameBegin(offset=35.39) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0108 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(35.39);
      logInfo(`frameBegin(offset=35.39): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0109
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0109
     * @tc.desc      TitleExpansionState.frameBegin(offset=12.41) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0109 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(12.41);
      logInfo(`frameBegin(offset=12.41): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0110
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0110
     * @tc.desc      TitleExpansionState.frameBegin(offset=94) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0110 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(94);
      logInfo(`frameBegin(offset=94): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0111
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0111
     * @tc.desc      TitleExpansionState.frameBegin(offset=71.59) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0111 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(71.59);
      logInfo(`frameBegin(offset=71.59): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0112
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0112
     * @tc.desc      TitleExpansionState.frameBegin(offset=97) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0112 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(97);
      logInfo(`frameBegin(offset=97): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0113
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0113
     * @tc.desc      TitleExpansionState.frameBegin(offset=-65) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0113 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-65);
      logInfo(`frameBegin(offset=-65): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-65) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0114
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0114
     * @tc.desc      TitleExpansionState.frameBegin(offset=124) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0114 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(124);
      logInfo(`frameBegin(offset=124): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0115
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0115
     * @tc.desc      TitleExpansionState.frameBegin(offset=131) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0115 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(131);
      logInfo(`frameBegin(offset=131): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0116
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0116
     * @tc.desc      TitleExpansionState.frameBegin(offset=173) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0116 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(173);
      logInfo(`frameBegin(offset=173): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0117
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0117
     * @tc.desc      TitleExpansionState.frameBegin(offset=56) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0117 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(56);
      logInfo(`frameBegin(offset=56): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0118
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0118
     * @tc.desc      TitleExpansionState.frameBegin(offset=51.19) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0118 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(51.19);
      logInfo(`frameBegin(offset=51.19): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0119
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0119
     * @tc.desc      TitleExpansionState.frameBegin(offset=181) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0119 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(181);
      logInfo(`frameBegin(offset=181): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0120
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0120
     * @tc.desc      TitleExpansionState.frameBegin(offset=11.82) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0120 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(11.82);
      logInfo(`frameBegin(offset=11.82): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0120 end`);
    });
  });
}
