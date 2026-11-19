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
import { translateYOfRefresh } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for translateYOfRefresh (59 cases). */
export default function translateYOfRefreshTest(): void {
  describe('TranslateYOfRefreshTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0001
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0001
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_TranslateYOfRefresh_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0001 begin`);
      const actual: number = translateYOfRefresh(-100, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0002
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0002
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=-1, maxTranslate=1, sensitivity=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_TranslateYOfRefresh_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0002 begin`);
      const actual: number = translateYOfRefresh(2, -1, 1, 5);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0003
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0003
     * @tc.desc      translateYOfRefresh(trYTop=100, deltaY=3, maxTranslate=2, sensitivity=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfRefresh_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0003 begin`);
      const actual: number = translateYOfRefresh(100, 3, 2, 2);
      logInfo(`translateYOfRefresh(trYTop=100, deltaY=3,...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0004
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0004
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=2, maxTranslate=3, sensitivity=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0004 begin`);
      const actual: number = translateYOfRefresh(-100, 2, 3, 100);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=2...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0005
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0005
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=1, maxTranslate=-1, sensitivity=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0005 begin`);
      const actual: number = translateYOfRefresh(50, 1, -1, 1);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0006
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0006
     * @tc.desc      translateYOfRefresh(trYTop=1, deltaY=100, maxTranslate=10, sensitivity=2) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0006 begin`);
      const actual: number = translateYOfRefresh(1, 100, 10, 2);
      logInfo(`translateYOfRefresh(trYTop=1, deltaY=100,...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0007
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0007
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=1, maxTranslate=5, sensitivity=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0007 begin`);
      const actual: number = translateYOfRefresh(50, 1, 5, 2);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=1, ...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0008
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0008
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=2, maxTranslate=100, sensitivity=-1) returns 48.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0008 begin`);
      const actual: number = translateYOfRefresh(50, 2, 100, -1);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=2, ...: actual=${actual}`);
      expect(actual).assertClose(48.8, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0009
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0009
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=50, maxTranslate=100, sensitivity=2) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfRefresh_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0009 begin`);
      const actual: number = translateYOfRefresh(50, 50, 100, 2);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=50,...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0010
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0010
     * @tc.desc      translateYOfRefresh(trYTop=100, deltaY=-1, maxTranslate=100, sensitivity=1) returns 99.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0010 begin`);
      const actual: number = translateYOfRefresh(100, -1, 100, 1);
      logInfo(`translateYOfRefresh(trYTop=100, deltaY=-1...: actual=${actual}`);
      expect(actual).assertClose(99.8, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0011
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0011
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=0, maxTranslate=100, sensitivity=-1) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0011 begin`);
      const actual: number = translateYOfRefresh(50, 0, 100, -1);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=0, ...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0012
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0012
     * @tc.desc      translateYOfRefresh(trYTop=1, deltaY=-1, maxTranslate=5, sensitivity=1) returns 0.19999999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0012 begin`);
      const actual: number = translateYOfRefresh(1, -1, 5, 1);
      logInfo(`translateYOfRefresh(trYTop=1, deltaY=-1, ...: actual=${actual}`);
      expect(actual).assertClose(0.19999999999999996, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0013
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0013
     * @tc.desc      translateYOfRefresh(trYTop=-1, deltaY=1, maxTranslate=100, sensitivity=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0013 begin`);
      const actual: number = translateYOfRefresh(-1, 1, 100, 10);
      logInfo(`translateYOfRefresh(trYTop=-1, deltaY=1, ...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0014
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0014
     * @tc.desc      translateYOfRefresh(trYTop=3, deltaY=1, maxTranslate=10, sensitivity=5) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0014 begin`);
      const actual: number = translateYOfRefresh(3, 1, 10, 5);
      logInfo(`translateYOfRefresh(trYTop=3, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0015
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0015
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=1, maxTranslate=100, sensitivity=3) returns 51.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0015 begin`);
      const actual: number = translateYOfRefresh(50, 1, 100, 3);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=1, ...: actual=${actual}`);
      expect(actual).assertClose(51.8, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0016
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0016
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=1, maxTranslate=100, sensitivity=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0016 begin`);
      const actual: number = translateYOfRefresh(2, 1, 100, 2);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0017
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0017
     * @tc.desc      translateYOfRefresh(trYTop=100, deltaY=-1, maxTranslate=100, sensitivity=10) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0017 begin`);
      const actual: number = translateYOfRefresh(100, -1, 100, 10);
      logInfo(`translateYOfRefresh(trYTop=100, deltaY=-1...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0018
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0018
     * @tc.desc      translateYOfRefresh(trYTop=-1, deltaY=1, maxTranslate=100, sensitivity=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0018 begin`);
      const actual: number = translateYOfRefresh(-1, 1, 100, 100);
      logInfo(`translateYOfRefresh(trYTop=-1, deltaY=1, ...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0019
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0019
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=1, maxTranslate=100, sensitivity=1) returns 50.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0019 begin`);
      const actual: number = translateYOfRefresh(50, 1, 100, 1);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=1, ...: actual=${actual}`);
      expect(actual).assertClose(50.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0020
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0020
     * @tc.desc      translateYOfRefresh(trYTop=3, deltaY=2, maxTranslate=10, sensitivity=3) returns 7.800000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfRefresh_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0020 begin`);
      const actual: number = translateYOfRefresh(3, 2, 10, 3);
      logInfo(`translateYOfRefresh(trYTop=3, deltaY=2, m...: actual=${actual}`);
      expect(actual).assertClose(7.800000000000001, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0021
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0021
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=-1, maxTranslate=3, sensitivity=1) returns 1.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0021 begin`);
      const actual: number = translateYOfRefresh(2, -1, 3, 1);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=-1, ...: actual=${actual}`);
      expect(actual).assertClose(1.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0022
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0022
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=3, maxTranslate=100, sensitivity=2) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfRefresh_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0022 begin`);
      const actual: number = translateYOfRefresh(2, 3, 100, 2);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=3, m...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0023
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0023
     * @tc.desc      translateYOfRefresh(trYTop=1, deltaY=-1, maxTranslate=1, sensitivity=2) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0023 begin`);
      const actual: number = translateYOfRefresh(1, -1, 1, 2);
      logInfo(`translateYOfRefresh(trYTop=1, deltaY=-1, ...: actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0024
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0024
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=-1, maxTranslate=2, sensitivity=3) returns 1.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0024 begin`);
      const actual: number = translateYOfRefresh(2, -1, 2, 3);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=-1, ...: actual=${actual}`);
      expect(actual).assertClose(1.4, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0025
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0025
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=1, maxTranslate=10, sensitivity=3) returns 4.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0025 begin`);
      const actual: number = translateYOfRefresh(2, 1, 10, 3);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertClose(4.4, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0026
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0026
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=1, maxTranslate=100, sensitivity=5) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0026 begin`);
      const actual: number = translateYOfRefresh(50, 1, 100, 5);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=1, ...: actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0027
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0027
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=3, maxTranslate=100, sensitivity=-1) returns 48.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0027 begin`);
      const actual: number = translateYOfRefresh(50, 3, 100, -1);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=3, ...: actual=${actual}`);
      expect(actual).assertClose(48.2, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0028
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0028
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=1, maxTranslate=10, sensitivity=-1) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0028 begin`);
      const actual: number = translateYOfRefresh(2, 1, 10, -1);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0029
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0029
     * @tc.desc      translateYOfRefresh(trYTop=3, deltaY=1, maxTranslate=10, sensitivity=3) returns 5.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0029 begin`);
      const actual: number = translateYOfRefresh(3, 1, 10, 3);
      logInfo(`translateYOfRefresh(trYTop=3, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertClose(5.4, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0030
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0030
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=1, maxTranslate=100, sensitivity=10) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0030 begin`);
      const actual: number = translateYOfRefresh(2, 1, 100, 10);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0031
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0031
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=2, maxTranslate=100, sensitivity=3) returns 53.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfRefresh_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0031 begin`);
      const actual: number = translateYOfRefresh(50, 2, 100, 3);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=2, ...: actual=${actual}`);
      expect(actual).assertClose(53.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0032
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0032
     * @tc.desc      translateYOfRefresh(trYTop=1, deltaY=-1, maxTranslate=5, sensitivity=-1) returns 1.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0032 begin`);
      const actual: number = translateYOfRefresh(1, -1, 5, -1);
      logInfo(`translateYOfRefresh(trYTop=1, deltaY=-1, ...: actual=${actual}`);
      expect(actual).assertClose(1.8, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0033
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0033
     * @tc.desc      translateYOfRefresh(trYTop=-1, deltaY=3, maxTranslate=100, sensitivity=10) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0033 begin`);
      const actual: number = translateYOfRefresh(-1, 3, 100, 10);
      logInfo(`translateYOfRefresh(trYTop=-1, deltaY=3, ...: actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0034
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0034
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=3, maxTranslate=5, sensitivity=1) returns 3.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0034 begin`);
      const actual: number = translateYOfRefresh(2, 3, 5, 1);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=3, m...: actual=${actual}`);
      expect(actual).assertClose(3.8, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0035
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0035
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=-1, maxTranslate=5, sensitivity=-1) returns 2.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0035 begin`);
      const actual: number = translateYOfRefresh(2, -1, 5, -1);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=-1, ...: actual=${actual}`);
      expect(actual).assertClose(2.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0036
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0036
     * @tc.desc      translateYOfRefresh(trYTop=1, deltaY=1, maxTranslate=5, sensitivity=3) returns 3.4000000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0036 begin`);
      const actual: number = translateYOfRefresh(1, 1, 5, 3);
      logInfo(`translateYOfRefresh(trYTop=1, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertClose(3.4000000000000004, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0037
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0037
     * @tc.desc      translateYOfRefresh(trYTop=-1, deltaY=50, maxTranslate=100, sensitivity=1) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0037 begin`);
      const actual: number = translateYOfRefresh(-1, 50, 100, 1);
      logInfo(`translateYOfRefresh(trYTop=-1, deltaY=50,...: actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0038
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0038
     * @tc.desc      translateYOfRefresh(trYTop=100, deltaY=-1, maxTranslate=100, sensitivity=100) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0038 begin`);
      const actual: number = translateYOfRefresh(100, -1, 100, 100);
      logInfo(`translateYOfRefresh(trYTop=100, deltaY=-1...: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0039
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0039
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=1, maxTranslate=3, sensitivity=1) returns 2.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfRefresh_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0039 begin`);
      const actual: number = translateYOfRefresh(2, 1, 3, 1);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=1, m...: actual=${actual}`);
      expect(actual).assertClose(2.4, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0040
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0040
     * @tc.desc      translateYOfRefresh(trYTop=-1, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0040 begin`);
      const actual: number = translateYOfRefresh(-1, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-1, deltaY=-10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0041
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0041
     * @tc.desc      translateYOfRefresh(trYTop=0, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0041 begin`);
      const actual: number = translateYOfRefresh(0, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=0, deltaY=-100...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0042
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0042
     * @tc.desc      translateYOfRefresh(trYTop=1, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0042 begin`);
      const actual: number = translateYOfRefresh(1, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=1, deltaY=-100...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0043
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0043
     * @tc.desc      translateYOfRefresh(trYTop=50, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0043 begin`);
      const actual: number = translateYOfRefresh(50, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=50, deltaY=-10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0044
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0044
     * @tc.desc      translateYOfRefresh(trYTop=100, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0044 begin`);
      const actual: number = translateYOfRefresh(100, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=100, deltaY=-1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0045
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0045
     * @tc.desc      translateYOfRefresh(trYTop=2, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0045 begin`);
      const actual: number = translateYOfRefresh(2, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=2, deltaY=-100...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0046
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0046
     * @tc.desc      translateYOfRefresh(trYTop=3, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0046 begin`);
      const actual: number = translateYOfRefresh(3, -100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=3, deltaY=-100...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0047
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0047
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-1, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0047 begin`);
      const actual: number = translateYOfRefresh(-100, -1, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0048
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0048
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=0, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0048 begin`);
      const actual: number = translateYOfRefresh(-100, 0, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0049
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0049
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=1, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0049 begin`);
      const actual: number = translateYOfRefresh(-100, 1, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0050
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0050
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=50, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0050 begin`);
      const actual: number = translateYOfRefresh(-100, 50, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=5...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0051
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0051
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0051 begin`);
      const actual: number = translateYOfRefresh(-100, 100, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0052
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0052
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=2, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0052 begin`);
      const actual: number = translateYOfRefresh(-100, 2, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=2...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0053
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0053
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=3, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0053 begin`);
      const actual: number = translateYOfRefresh(-100, 3, 0, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=3...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0054
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0054
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-100, maxTranslate=1, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0054 begin`);
      const actual: number = translateYOfRefresh(-100, -100, 1, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0055
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0055
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-100, maxTranslate=-1, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0055 begin`);
      const actual: number = translateYOfRefresh(-100, -100, -1, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0056
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0056
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-100, maxTranslate=2, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0056 begin`);
      const actual: number = translateYOfRefresh(-100, -100, 2, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0057
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0057
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-100, maxTranslate=5, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0057 begin`);
      const actual: number = translateYOfRefresh(-100, -100, 5, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0058
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0058
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-100, maxTranslate=10, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0058 begin`);
      const actual: number = translateYOfRefresh(-100, -100, 10, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_REFRESH_0059
     * @tc.name      PullToRefresh_TranslateYOfRefresh_0059
     * @tc.desc      translateYOfRefresh(trYTop=-100, deltaY=-100, maxTranslate=100, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfRefresh_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfRefresh_0059 begin`);
      const actual: number = translateYOfRefresh(-100, -100, 100, 0);
      logInfo(`translateYOfRefresh(trYTop=-100, deltaY=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfRefresh_0059 end`);
    });
  });
}
