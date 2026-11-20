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
import { translateYOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for translateYOf (24 cases). */
export default function translateYOf2Test(): void {
  describe('TranslateYOf2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0097
     * @tc.name      ExpandTitle_TranslateYOf_0097
     * @tc.desc      translateYOf(curOffset=8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0097 begin`);
      const actual: number = translateYOf(8);
      logInfo(`translateYOf(curOffset=8): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0098
     * @tc.name      ExpandTitle_TranslateYOf_0098
     * @tc.desc      translateYOf(curOffset=68) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0098 begin`);
      const actual: number = translateYOf(68);
      logInfo(`translateYOf(curOffset=68): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0099
     * @tc.name      ExpandTitle_TranslateYOf_0099
     * @tc.desc      translateYOf(curOffset=77.66) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0099 begin`);
      const actual: number = translateYOf(77.66);
      logInfo(`translateYOf(curOffset=77.66): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0100
     * @tc.name      ExpandTitle_TranslateYOf_0100
     * @tc.desc      translateYOf(curOffset=97) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0100 begin`);
      const actual: number = translateYOf(97);
      logInfo(`translateYOf(curOffset=97): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0101
     * @tc.name      ExpandTitle_TranslateYOf_0101
     * @tc.desc      translateYOf(curOffset=12.21) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0101 begin`);
      const actual: number = translateYOf(12.21);
      logInfo(`translateYOf(curOffset=12.21): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0102
     * @tc.name      ExpandTitle_TranslateYOf_0102
     * @tc.desc      translateYOf(curOffset=29.83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0102 begin`);
      const actual: number = translateYOf(29.83);
      logInfo(`translateYOf(curOffset=29.83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0103
     * @tc.name      ExpandTitle_TranslateYOf_0103
     * @tc.desc      translateYOf(curOffset=99.18) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0103 begin`);
      const actual: number = translateYOf(99.18);
      logInfo(`translateYOf(curOffset=99.18): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0104
     * @tc.name      ExpandTitle_TranslateYOf_0104
     * @tc.desc      translateYOf(curOffset=33.32) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0104 begin`);
      const actual: number = translateYOf(33.32);
      logInfo(`translateYOf(curOffset=33.32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0105
     * @tc.name      ExpandTitle_TranslateYOf_0105
     * @tc.desc      translateYOf(curOffset=138) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0105 begin`);
      const actual: number = translateYOf(138);
      logInfo(`translateYOf(curOffset=138): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0106
     * @tc.name      ExpandTitle_TranslateYOf_0106
     * @tc.desc      translateYOf(curOffset=12.55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0106 begin`);
      const actual: number = translateYOf(12.55);
      logInfo(`translateYOf(curOffset=12.55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0107
     * @tc.name      ExpandTitle_TranslateYOf_0107
     * @tc.desc      translateYOf(curOffset=11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0107 begin`);
      const actual: number = translateYOf(11);
      logInfo(`translateYOf(curOffset=11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0108
     * @tc.name      ExpandTitle_TranslateYOf_0108
     * @tc.desc      translateYOf(curOffset=99.97) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0108 begin`);
      const actual: number = translateYOf(99.97);
      logInfo(`translateYOf(curOffset=99.97): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0109
     * @tc.name      ExpandTitle_TranslateYOf_0109
     * @tc.desc      translateYOf(curOffset=131) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0109 begin`);
      const actual: number = translateYOf(131);
      logInfo(`translateYOf(curOffset=131): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0110
     * @tc.name      ExpandTitle_TranslateYOf_0110
     * @tc.desc      translateYOf(curOffset=77) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0110 begin`);
      const actual: number = translateYOf(77);
      logInfo(`translateYOf(curOffset=77): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0111
     * @tc.name      ExpandTitle_TranslateYOf_0111
     * @tc.desc      translateYOf(curOffset=41) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0111 begin`);
      const actual: number = translateYOf(41);
      logInfo(`translateYOf(curOffset=41): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0112
     * @tc.name      ExpandTitle_TranslateYOf_0112
     * @tc.desc      translateYOf(curOffset=53) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0112 begin`);
      const actual: number = translateYOf(53);
      logInfo(`translateYOf(curOffset=53): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0113
     * @tc.name      ExpandTitle_TranslateYOf_0113
     * @tc.desc      translateYOf(curOffset=99) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0113 begin`);
      const actual: number = translateYOf(99);
      logInfo(`translateYOf(curOffset=99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0114
     * @tc.name      ExpandTitle_TranslateYOf_0114
     * @tc.desc      translateYOf(curOffset=18) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0114 begin`);
      const actual: number = translateYOf(18);
      logInfo(`translateYOf(curOffset=18): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0115
     * @tc.name      ExpandTitle_TranslateYOf_0115
     * @tc.desc      translateYOf(curOffset=118) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0115 begin`);
      const actual: number = translateYOf(118);
      logInfo(`translateYOf(curOffset=118): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0116
     * @tc.name      ExpandTitle_TranslateYOf_0116
     * @tc.desc      translateYOf(curOffset=2.73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0116 begin`);
      const actual: number = translateYOf(2.73);
      logInfo(`translateYOf(curOffset=2.73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0117
     * @tc.name      ExpandTitle_TranslateYOf_0117
     * @tc.desc      translateYOf(curOffset=199) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0117 begin`);
      const actual: number = translateYOf(199);
      logInfo(`translateYOf(curOffset=199): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0118
     * @tc.name      ExpandTitle_TranslateYOf_0118
     * @tc.desc      translateYOf(curOffset=58.79) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0118 begin`);
      const actual: number = translateYOf(58.79);
      logInfo(`translateYOf(curOffset=58.79): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0119
     * @tc.name      ExpandTitle_TranslateYOf_0119
     * @tc.desc      translateYOf(curOffset=70.65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0119 begin`);
      const actual: number = translateYOf(70.65);
      logInfo(`translateYOf(curOffset=70.65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0120
     * @tc.name      ExpandTitle_TranslateYOf_0120
     * @tc.desc      translateYOf(curOffset=15.74) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0120 begin`);
      const actual: number = translateYOf(15.74);
      logInfo(`translateYOf(curOffset=15.74): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0120 end`);
    });
  });
}
