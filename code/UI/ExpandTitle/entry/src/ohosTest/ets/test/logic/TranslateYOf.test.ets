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

/** Logic checks for translateYOf (96 cases). */
export default function translateYOfTest(): void {
  describe('TranslateYOfTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0001
     * @tc.name      ExpandTitle_TranslateYOf_0001
     * @tc.desc      translateYOf(curOffset=-100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TranslateYOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TranslateYOf_0001 begin`);
      const actual: number = translateYOf(-100);
      logInfo(`translateYOf(curOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}TranslateYOf_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0002
     * @tc.name      ExpandTitle_TranslateYOf_0002
     * @tc.desc      translateYOf(curOffset=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TranslateYOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TranslateYOf_0002 begin`);
      const actual: number = translateYOf(-1);
      logInfo(`translateYOf(curOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TranslateYOf_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0003
     * @tc.name      ExpandTitle_TranslateYOf_0003
     * @tc.desc      translateYOf(curOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_TranslateYOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOf_0003 begin`);
      const actual: number = translateYOf(0);
      logInfo(`translateYOf(curOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0004
     * @tc.name      ExpandTitle_TranslateYOf_0004
     * @tc.desc      translateYOf(curOffset=-10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0004 begin`);
      const actual: number = translateYOf(-10);
      logInfo(`translateYOf(curOffset=-10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TranslateYOf_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0005
     * @tc.name      ExpandTitle_TranslateYOf_0005
     * @tc.desc      translateYOf(curOffset=-18) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0005 begin`);
      const actual: number = translateYOf(-18);
      logInfo(`translateYOf(curOffset=-18): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}TranslateYOf_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0006
     * @tc.name      ExpandTitle_TranslateYOf_0006
     * @tc.desc      translateYOf(curOffset=-17) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0006 begin`);
      const actual: number = translateYOf(-17);
      logInfo(`translateYOf(curOffset=-17): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}TranslateYOf_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0007
     * @tc.name      ExpandTitle_TranslateYOf_0007
     * @tc.desc      translateYOf(curOffset=-6) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0007 begin`);
      const actual: number = translateYOf(-6);
      logInfo(`translateYOf(curOffset=-6): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TranslateYOf_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0008
     * @tc.name      ExpandTitle_TranslateYOf_0008
     * @tc.desc      translateYOf(curOffset=-31) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0008 begin`);
      const actual: number = translateYOf(-31);
      logInfo(`translateYOf(curOffset=-31): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TranslateYOf_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0009
     * @tc.name      ExpandTitle_TranslateYOf_0009
     * @tc.desc      translateYOf(curOffset=-9) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0009 begin`);
      const actual: number = translateYOf(-9);
      logInfo(`translateYOf(curOffset=-9): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TranslateYOf_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0010
     * @tc.name      ExpandTitle_TranslateYOf_0010
     * @tc.desc      translateYOf(curOffset=-20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0010 begin`);
      const actual: number = translateYOf(-20);
      logInfo(`translateYOf(curOffset=-20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}TranslateYOf_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0011
     * @tc.name      ExpandTitle_TranslateYOf_0011
     * @tc.desc      translateYOf(curOffset=-67) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0011 begin`);
      const actual: number = translateYOf(-67);
      logInfo(`translateYOf(curOffset=-67): actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}TranslateYOf_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0012
     * @tc.name      ExpandTitle_TranslateYOf_0012
     * @tc.desc      translateYOf(curOffset=-93) returns 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0012 begin`);
      const actual: number = translateYOf(-93);
      logInfo(`translateYOf(curOffset=-93): actual=${actual}`);
      expect(actual).assertEqual(93);
      logInfo(`${BUNDLE}TranslateYOf_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0013
     * @tc.name      ExpandTitle_TranslateYOf_0013
     * @tc.desc      translateYOf(curOffset=-97) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0013 begin`);
      const actual: number = translateYOf(-97);
      logInfo(`translateYOf(curOffset=-97): actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}TranslateYOf_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0014
     * @tc.name      ExpandTitle_TranslateYOf_0014
     * @tc.desc      translateYOf(curOffset=-98) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0014 begin`);
      const actual: number = translateYOf(-98);
      logInfo(`translateYOf(curOffset=-98): actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}TranslateYOf_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0015
     * @tc.name      ExpandTitle_TranslateYOf_0015
     * @tc.desc      translateYOf(curOffset=-51) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0015 begin`);
      const actual: number = translateYOf(-51);
      logInfo(`translateYOf(curOffset=-51): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}TranslateYOf_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0016
     * @tc.name      ExpandTitle_TranslateYOf_0016
     * @tc.desc      translateYOf(curOffset=-78) returns 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0016 begin`);
      const actual: number = translateYOf(-78);
      logInfo(`translateYOf(curOffset=-78): actual=${actual}`);
      expect(actual).assertEqual(78);
      logInfo(`${BUNDLE}TranslateYOf_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0017
     * @tc.name      ExpandTitle_TranslateYOf_0017
     * @tc.desc      translateYOf(curOffset=-38) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0017 begin`);
      const actual: number = translateYOf(-38);
      logInfo(`translateYOf(curOffset=-38): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}TranslateYOf_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0018
     * @tc.name      ExpandTitle_TranslateYOf_0018
     * @tc.desc      translateYOf(curOffset=-96) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0018 begin`);
      const actual: number = translateYOf(-96);
      logInfo(`translateYOf(curOffset=-96): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}TranslateYOf_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0019
     * @tc.name      ExpandTitle_TranslateYOf_0019
     * @tc.desc      translateYOf(curOffset=-43) returns 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0019 begin`);
      const actual: number = translateYOf(-43);
      logInfo(`translateYOf(curOffset=-43): actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}TranslateYOf_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0020
     * @tc.name      ExpandTitle_TranslateYOf_0020
     * @tc.desc      translateYOf(curOffset=-77) returns 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0020 begin`);
      const actual: number = translateYOf(-77);
      logInfo(`translateYOf(curOffset=-77): actual=${actual}`);
      expect(actual).assertEqual(77);
      logInfo(`${BUNDLE}TranslateYOf_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0021
     * @tc.name      ExpandTitle_TranslateYOf_0021
     * @tc.desc      translateYOf(curOffset=-82) returns 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0021 begin`);
      const actual: number = translateYOf(-82);
      logInfo(`translateYOf(curOffset=-82): actual=${actual}`);
      expect(actual).assertEqual(82);
      logInfo(`${BUNDLE}TranslateYOf_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0022
     * @tc.name      ExpandTitle_TranslateYOf_0022
     * @tc.desc      translateYOf(curOffset=-28) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0022 begin`);
      const actual: number = translateYOf(-28);
      logInfo(`translateYOf(curOffset=-28): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TranslateYOf_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0023
     * @tc.name      ExpandTitle_TranslateYOf_0023
     * @tc.desc      translateYOf(curOffset=-52) returns 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TranslateYOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOf_0023 begin`);
      const actual: number = translateYOf(-52);
      logInfo(`translateYOf(curOffset=-52): actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`${BUNDLE}TranslateYOf_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0024
     * @tc.name      ExpandTitle_TranslateYOf_0024
     * @tc.desc      translateYOf(curOffset=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_TranslateYOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOf_0024 begin`);
      const actual: number = translateYOf(1);
      logInfo(`translateYOf(curOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0025
     * @tc.name      ExpandTitle_TranslateYOf_0025
     * @tc.desc      translateYOf(curOffset=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0025 begin`);
      const actual: number = translateYOf(50);
      logInfo(`translateYOf(curOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0026
     * @tc.name      ExpandTitle_TranslateYOf_0026
     * @tc.desc      translateYOf(curOffset=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0026 begin`);
      const actual: number = translateYOf(100);
      logInfo(`translateYOf(curOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0027
     * @tc.name      ExpandTitle_TranslateYOf_0027
     * @tc.desc      translateYOf(curOffset=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0027 begin`);
      const actual: number = translateYOf(2);
      logInfo(`translateYOf(curOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0028
     * @tc.name      ExpandTitle_TranslateYOf_0028
     * @tc.desc      translateYOf(curOffset=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0028 begin`);
      const actual: number = translateYOf(3);
      logInfo(`translateYOf(curOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0029
     * @tc.name      ExpandTitle_TranslateYOf_0029
     * @tc.desc      translateYOf(curOffset=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0029 begin`);
      const actual: number = translateYOf(10);
      logInfo(`translateYOf(curOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0030
     * @tc.name      ExpandTitle_TranslateYOf_0030
     * @tc.desc      translateYOf(curOffset=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0030 begin`);
      const actual: number = translateYOf(5);
      logInfo(`translateYOf(curOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0031
     * @tc.name      ExpandTitle_TranslateYOf_0031
     * @tc.desc      translateYOf(curOffset=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0031 begin`);
      const actual: number = translateYOf(15);
      logInfo(`translateYOf(curOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0032
     * @tc.name      ExpandTitle_TranslateYOf_0032
     * @tc.desc      translateYOf(curOffset=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0032 begin`);
      const actual: number = translateYOf(20);
      logInfo(`translateYOf(curOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0033
     * @tc.name      ExpandTitle_TranslateYOf_0033
     * @tc.desc      translateYOf(curOffset=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0033 begin`);
      const actual: number = translateYOf(25);
      logInfo(`translateYOf(curOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0034
     * @tc.name      ExpandTitle_TranslateYOf_0034
     * @tc.desc      translateYOf(curOffset=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0034 begin`);
      const actual: number = translateYOf(30);
      logInfo(`translateYOf(curOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0035
     * @tc.name      ExpandTitle_TranslateYOf_0035
     * @tc.desc      translateYOf(curOffset=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0035 begin`);
      const actual: number = translateYOf(35);
      logInfo(`translateYOf(curOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0036
     * @tc.name      ExpandTitle_TranslateYOf_0036
     * @tc.desc      translateYOf(curOffset=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0036 begin`);
      const actual: number = translateYOf(40);
      logInfo(`translateYOf(curOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0037
     * @tc.name      ExpandTitle_TranslateYOf_0037
     * @tc.desc      translateYOf(curOffset=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0037 begin`);
      const actual: number = translateYOf(45);
      logInfo(`translateYOf(curOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0038
     * @tc.name      ExpandTitle_TranslateYOf_0038
     * @tc.desc      translateYOf(curOffset=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0038 begin`);
      const actual: number = translateYOf(55);
      logInfo(`translateYOf(curOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0039
     * @tc.name      ExpandTitle_TranslateYOf_0039
     * @tc.desc      translateYOf(curOffset=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0039 begin`);
      const actual: number = translateYOf(60);
      logInfo(`translateYOf(curOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0040
     * @tc.name      ExpandTitle_TranslateYOf_0040
     * @tc.desc      translateYOf(curOffset=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0040 begin`);
      const actual: number = translateYOf(65);
      logInfo(`translateYOf(curOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0041
     * @tc.name      ExpandTitle_TranslateYOf_0041
     * @tc.desc      translateYOf(curOffset=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0041 begin`);
      const actual: number = translateYOf(70);
      logInfo(`translateYOf(curOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0042
     * @tc.name      ExpandTitle_TranslateYOf_0042
     * @tc.desc      translateYOf(curOffset=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0042 begin`);
      const actual: number = translateYOf(75);
      logInfo(`translateYOf(curOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0043
     * @tc.name      ExpandTitle_TranslateYOf_0043
     * @tc.desc      translateYOf(curOffset=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0043 begin`);
      const actual: number = translateYOf(80);
      logInfo(`translateYOf(curOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0044
     * @tc.name      ExpandTitle_TranslateYOf_0044
     * @tc.desc      translateYOf(curOffset=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0044 begin`);
      const actual: number = translateYOf(85);
      logInfo(`translateYOf(curOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0045
     * @tc.name      ExpandTitle_TranslateYOf_0045
     * @tc.desc      translateYOf(curOffset=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0045 begin`);
      const actual: number = translateYOf(90);
      logInfo(`translateYOf(curOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0046
     * @tc.name      ExpandTitle_TranslateYOf_0046
     * @tc.desc      translateYOf(curOffset=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0046 begin`);
      const actual: number = translateYOf(95);
      logInfo(`translateYOf(curOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0047
     * @tc.name      ExpandTitle_TranslateYOf_0047
     * @tc.desc      translateYOf(curOffset=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0047 begin`);
      const actual: number = translateYOf(105);
      logInfo(`translateYOf(curOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0048
     * @tc.name      ExpandTitle_TranslateYOf_0048
     * @tc.desc      translateYOf(curOffset=110) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0048 begin`);
      const actual: number = translateYOf(110);
      logInfo(`translateYOf(curOffset=110): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0049
     * @tc.name      ExpandTitle_TranslateYOf_0049
     * @tc.desc      translateYOf(curOffset=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0049 begin`);
      const actual: number = translateYOf(115);
      logInfo(`translateYOf(curOffset=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0050
     * @tc.name      ExpandTitle_TranslateYOf_0050
     * @tc.desc      translateYOf(curOffset=120) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0050 begin`);
      const actual: number = translateYOf(120);
      logInfo(`translateYOf(curOffset=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0051
     * @tc.name      ExpandTitle_TranslateYOf_0051
     * @tc.desc      translateYOf(curOffset=125) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0051 begin`);
      const actual: number = translateYOf(125);
      logInfo(`translateYOf(curOffset=125): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0052
     * @tc.name      ExpandTitle_TranslateYOf_0052
     * @tc.desc      translateYOf(curOffset=130) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0052 begin`);
      const actual: number = translateYOf(130);
      logInfo(`translateYOf(curOffset=130): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0053
     * @tc.name      ExpandTitle_TranslateYOf_0053
     * @tc.desc      translateYOf(curOffset=135) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0053 begin`);
      const actual: number = translateYOf(135);
      logInfo(`translateYOf(curOffset=135): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0054
     * @tc.name      ExpandTitle_TranslateYOf_0054
     * @tc.desc      translateYOf(curOffset=140) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0054 begin`);
      const actual: number = translateYOf(140);
      logInfo(`translateYOf(curOffset=140): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0055
     * @tc.name      ExpandTitle_TranslateYOf_0055
     * @tc.desc      translateYOf(curOffset=145) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0055 begin`);
      const actual: number = translateYOf(145);
      logInfo(`translateYOf(curOffset=145): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0056
     * @tc.name      ExpandTitle_TranslateYOf_0056
     * @tc.desc      translateYOf(curOffset=150) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0056 begin`);
      const actual: number = translateYOf(150);
      logInfo(`translateYOf(curOffset=150): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0057
     * @tc.name      ExpandTitle_TranslateYOf_0057
     * @tc.desc      translateYOf(curOffset=155) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0057 begin`);
      const actual: number = translateYOf(155);
      logInfo(`translateYOf(curOffset=155): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0058
     * @tc.name      ExpandTitle_TranslateYOf_0058
     * @tc.desc      translateYOf(curOffset=160) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0058 begin`);
      const actual: number = translateYOf(160);
      logInfo(`translateYOf(curOffset=160): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0059
     * @tc.name      ExpandTitle_TranslateYOf_0059
     * @tc.desc      translateYOf(curOffset=165) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0059 begin`);
      const actual: number = translateYOf(165);
      logInfo(`translateYOf(curOffset=165): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0060
     * @tc.name      ExpandTitle_TranslateYOf_0060
     * @tc.desc      translateYOf(curOffset=170) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0060 begin`);
      const actual: number = translateYOf(170);
      logInfo(`translateYOf(curOffset=170): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0061
     * @tc.name      ExpandTitle_TranslateYOf_0061
     * @tc.desc      translateYOf(curOffset=175) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0061 begin`);
      const actual: number = translateYOf(175);
      logInfo(`translateYOf(curOffset=175): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0062
     * @tc.name      ExpandTitle_TranslateYOf_0062
     * @tc.desc      translateYOf(curOffset=180) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0062 begin`);
      const actual: number = translateYOf(180);
      logInfo(`translateYOf(curOffset=180): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0063
     * @tc.name      ExpandTitle_TranslateYOf_0063
     * @tc.desc      translateYOf(curOffset=185) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0063 begin`);
      const actual: number = translateYOf(185);
      logInfo(`translateYOf(curOffset=185): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0064
     * @tc.name      ExpandTitle_TranslateYOf_0064
     * @tc.desc      translateYOf(curOffset=190) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0064 begin`);
      const actual: number = translateYOf(190);
      logInfo(`translateYOf(curOffset=190): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0065
     * @tc.name      ExpandTitle_TranslateYOf_0065
     * @tc.desc      translateYOf(curOffset=195) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0065 begin`);
      const actual: number = translateYOf(195);
      logInfo(`translateYOf(curOffset=195): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0066
     * @tc.name      ExpandTitle_TranslateYOf_0066
     * @tc.desc      translateYOf(curOffset=200) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0066 begin`);
      const actual: number = translateYOf(200);
      logInfo(`translateYOf(curOffset=200): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0067
     * @tc.name      ExpandTitle_TranslateYOf_0067
     * @tc.desc      translateYOf(curOffset=181) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0067 begin`);
      const actual: number = translateYOf(181);
      logInfo(`translateYOf(curOffset=181): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0068
     * @tc.name      ExpandTitle_TranslateYOf_0068
     * @tc.desc      translateYOf(curOffset=159) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0068 begin`);
      const actual: number = translateYOf(159);
      logInfo(`translateYOf(curOffset=159): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0069
     * @tc.name      ExpandTitle_TranslateYOf_0069
     * @tc.desc      translateYOf(curOffset=72.85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0069 begin`);
      const actual: number = translateYOf(72.85);
      logInfo(`translateYOf(curOffset=72.85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0070
     * @tc.name      ExpandTitle_TranslateYOf_0070
     * @tc.desc      translateYOf(curOffset=83.19) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0070 begin`);
      const actual: number = translateYOf(83.19);
      logInfo(`translateYOf(curOffset=83.19): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0071
     * @tc.name      ExpandTitle_TranslateYOf_0071
     * @tc.desc      translateYOf(curOffset=7.62) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0071 begin`);
      const actual: number = translateYOf(7.62);
      logInfo(`translateYOf(curOffset=7.62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0072
     * @tc.name      ExpandTitle_TranslateYOf_0072
     * @tc.desc      translateYOf(curOffset=137) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0072 begin`);
      const actual: number = translateYOf(137);
      logInfo(`translateYOf(curOffset=137): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0073
     * @tc.name      ExpandTitle_TranslateYOf_0073
     * @tc.desc      translateYOf(curOffset=57) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0073 begin`);
      const actual: number = translateYOf(57);
      logInfo(`translateYOf(curOffset=57): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0074
     * @tc.name      ExpandTitle_TranslateYOf_0074
     * @tc.desc      translateYOf(curOffset=84) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0074 begin`);
      const actual: number = translateYOf(84);
      logInfo(`translateYOf(curOffset=84): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0075
     * @tc.name      ExpandTitle_TranslateYOf_0075
     * @tc.desc      translateYOf(curOffset=83.02) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0075 begin`);
      const actual: number = translateYOf(83.02);
      logInfo(`translateYOf(curOffset=83.02): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0076
     * @tc.name      ExpandTitle_TranslateYOf_0076
     * @tc.desc      translateYOf(curOffset=64) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0076 begin`);
      const actual: number = translateYOf(64);
      logInfo(`translateYOf(curOffset=64): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0077
     * @tc.name      ExpandTitle_TranslateYOf_0077
     * @tc.desc      translateYOf(curOffset=71) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0077 begin`);
      const actual: number = translateYOf(71);
      logInfo(`translateYOf(curOffset=71): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0078
     * @tc.name      ExpandTitle_TranslateYOf_0078
     * @tc.desc      translateYOf(curOffset=6) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0078 begin`);
      const actual: number = translateYOf(6);
      logInfo(`translateYOf(curOffset=6): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0079
     * @tc.name      ExpandTitle_TranslateYOf_0079
     * @tc.desc      translateYOf(curOffset=13.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0079 begin`);
      const actual: number = translateYOf(13.1);
      logInfo(`translateYOf(curOffset=13.1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0080
     * @tc.name      ExpandTitle_TranslateYOf_0080
     * @tc.desc      translateYOf(curOffset=42) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0080 begin`);
      const actual: number = translateYOf(42);
      logInfo(`translateYOf(curOffset=42): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0081
     * @tc.name      ExpandTitle_TranslateYOf_0081
     * @tc.desc      translateYOf(curOffset=65.32) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0081 begin`);
      const actual: number = translateYOf(65.32);
      logInfo(`translateYOf(curOffset=65.32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0082
     * @tc.name      ExpandTitle_TranslateYOf_0082
     * @tc.desc      translateYOf(curOffset=29.07) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0082 begin`);
      const actual: number = translateYOf(29.07);
      logInfo(`translateYOf(curOffset=29.07): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0083
     * @tc.name      ExpandTitle_TranslateYOf_0083
     * @tc.desc      translateYOf(curOffset=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0083 begin`);
      const actual: number = translateYOf(96);
      logInfo(`translateYOf(curOffset=96): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0084
     * @tc.name      ExpandTitle_TranslateYOf_0084
     * @tc.desc      translateYOf(curOffset=56) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0084 begin`);
      const actual: number = translateYOf(56);
      logInfo(`translateYOf(curOffset=56): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0085
     * @tc.name      ExpandTitle_TranslateYOf_0085
     * @tc.desc      translateYOf(curOffset=117) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0085 begin`);
      const actual: number = translateYOf(117);
      logInfo(`translateYOf(curOffset=117): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0086
     * @tc.name      ExpandTitle_TranslateYOf_0086
     * @tc.desc      translateYOf(curOffset=13.51) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0086 begin`);
      const actual: number = translateYOf(13.51);
      logInfo(`translateYOf(curOffset=13.51): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0087
     * @tc.name      ExpandTitle_TranslateYOf_0087
     * @tc.desc      translateYOf(curOffset=129) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0087 begin`);
      const actual: number = translateYOf(129);
      logInfo(`translateYOf(curOffset=129): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0088
     * @tc.name      ExpandTitle_TranslateYOf_0088
     * @tc.desc      translateYOf(curOffset=128) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0088 begin`);
      const actual: number = translateYOf(128);
      logInfo(`translateYOf(curOffset=128): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0089
     * @tc.name      ExpandTitle_TranslateYOf_0089
     * @tc.desc      translateYOf(curOffset=21.21) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0089 begin`);
      const actual: number = translateYOf(21.21);
      logInfo(`translateYOf(curOffset=21.21): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0090
     * @tc.name      ExpandTitle_TranslateYOf_0090
     * @tc.desc      translateYOf(curOffset=81) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0090 begin`);
      const actual: number = translateYOf(81);
      logInfo(`translateYOf(curOffset=81): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0091
     * @tc.name      ExpandTitle_TranslateYOf_0091
     * @tc.desc      translateYOf(curOffset=16) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0091 begin`);
      const actual: number = translateYOf(16);
      logInfo(`translateYOf(curOffset=16): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0092
     * @tc.name      ExpandTitle_TranslateYOf_0092
     * @tc.desc      translateYOf(curOffset=9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0092 begin`);
      const actual: number = translateYOf(9);
      logInfo(`translateYOf(curOffset=9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0093
     * @tc.name      ExpandTitle_TranslateYOf_0093
     * @tc.desc      translateYOf(curOffset=84.99) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0093 begin`);
      const actual: number = translateYOf(84.99);
      logInfo(`translateYOf(curOffset=84.99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0094
     * @tc.name      ExpandTitle_TranslateYOf_0094
     * @tc.desc      translateYOf(curOffset=142) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0094 begin`);
      const actual: number = translateYOf(142);
      logInfo(`translateYOf(curOffset=142): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0095
     * @tc.name      ExpandTitle_TranslateYOf_0095
     * @tc.desc      translateYOf(curOffset=192) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0095 begin`);
      const actual: number = translateYOf(192);
      logInfo(`translateYOf(curOffset=192): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TRANSLATE_YOF_0096
     * @tc.name      ExpandTitle_TranslateYOf_0096
     * @tc.desc      translateYOf(curOffset=82) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TranslateYOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOf_0096 begin`);
      const actual: number = translateYOf(82);
      logInfo(`translateYOf(curOffset=82): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOf_0096 end`);
    });
  });
}
