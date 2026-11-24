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
import { translateYOfLoadMore } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for translateYOfLoadMore (59 cases). */
export default function translateYOfLoadMoreTest(): void {
  describe('TranslateYOfLoadMoreTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0001
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0001
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_TranslateYOfLoadMore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0001 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0002
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0002
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=1, sensitivity=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_TranslateYOfLoadMore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0002 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 1, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0003
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0003
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=-1, sensitivity=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0003 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, -1, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0004
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0004
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=2, sensitivity=0) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0004 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 2, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0005
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0005
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=5, sensitivity=0) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0005 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 5, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0006
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0006
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=10, sensitivity=0) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0006 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 10, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0007
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0007
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=100, sensitivity=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0007 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 100, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0008
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0008
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=3, sensitivity=0) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0008 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 3, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0009
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0009
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=1, maxTranslate=5, sensitivity=1) returns -0.199999999...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0009 begin`);
      const actual: number = translateYOfLoadMore(-1, 1, 5, 1);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertClose(-0.19999999999999996, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0010
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0010
     * @tc.desc      translateYOfLoadMore(trYBottom=50, deltaY=-100, maxTranslate=100, sensitivity=1) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0010 begin`);
      const actual: number = translateYOfLoadMore(50, -100, 100, 1);
      logInfo(`translateYOfLoadMore(trYBottom=50, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0011
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0011
     * @tc.desc      translateYOfLoadMore(trYBottom=2, deltaY=-1, maxTranslate=10, sensitivity=10) returns -8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0011 begin`);
      const actual: number = translateYOfLoadMore(2, -1, 10, 10);
      logInfo(`translateYOfLoadMore(trYBottom=2, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(-8);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0012
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0012
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=2, maxTranslate=100, sensitivity=1) returns -99.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0012 begin`);
      const actual: number = translateYOfLoadMore(-100, 2, 100, 1);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertClose(-99.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0013
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0013
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=-1, maxTranslate=2, sensitivity=1) returns -1.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0013 begin`);
      const actual: number = translateYOfLoadMore(-1, -1, 2, 1);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertClose(-1.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0014
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0014
     * @tc.desc      translateYOfLoadMore(trYBottom=1, deltaY=-1, maxTranslate=100, sensitivity=100) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0014 begin`);
      const actual: number = translateYOfLoadMore(1, -1, 100, 100);
      logInfo(`translateYOfLoadMore(trYBottom=1, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(-99);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0015
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0015
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=-1, maxTranslate=10, sensitivity=5) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0015 begin`);
      const actual: number = translateYOfLoadMore(-1, -1, 10, 5);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0016
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0016
     * @tc.desc      translateYOfLoadMore(trYBottom=2, deltaY=50, maxTranslate=100, sensitivity=-1) returns -48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0016 begin`);
      const actual: number = translateYOfLoadMore(2, 50, 100, -1);
      logInfo(`translateYOfLoadMore(trYBottom=2, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(-48);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0017
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0017
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=-1, maxTranslate=3, sensitivity=2) returns -2.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0017 begin`);
      const actual: number = translateYOfLoadMore(-1, -1, 3, 2);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertClose(-2.6, PRECISION);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0018
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0018
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=1, maxTranslate=100, sensitivity=100) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0018 begin`);
      const actual: number = translateYOfLoadMore(-100, 1, 100, 100);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0019
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0019
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=-1, maxTranslate=10, sensitivity=3) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0019 begin`);
      const actual: number = translateYOfLoadMore(-1, -1, 10, 3);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0020
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0020
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0020 begin`);
      const actual: number = translateYOfLoadMore(-1, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0021
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0021
     * @tc.desc      translateYOfLoadMore(trYBottom=0, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0021 begin`);
      const actual: number = translateYOfLoadMore(0, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=0, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0022
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0022
     * @tc.desc      translateYOfLoadMore(trYBottom=1, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0022 begin`);
      const actual: number = translateYOfLoadMore(1, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=1, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0023
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0023
     * @tc.desc      translateYOfLoadMore(trYBottom=50, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0023 begin`);
      const actual: number = translateYOfLoadMore(50, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=50, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0024
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0024
     * @tc.desc      translateYOfLoadMore(trYBottom=100, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0024 begin`);
      const actual: number = translateYOfLoadMore(100, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=100, delta...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0025
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0025
     * @tc.desc      translateYOfLoadMore(trYBottom=2, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0025 begin`);
      const actual: number = translateYOfLoadMore(2, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=2, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0026
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0026
     * @tc.desc      translateYOfLoadMore(trYBottom=3, deltaY=-100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0026 begin`);
      const actual: number = translateYOfLoadMore(3, -100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=3, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0027
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0027
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-1, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0027 begin`);
      const actual: number = translateYOfLoadMore(-100, -1, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0028
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0028
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=0, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0028 begin`);
      const actual: number = translateYOfLoadMore(-100, 0, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0029
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0029
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=1, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0029 begin`);
      const actual: number = translateYOfLoadMore(-100, 1, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0030
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0030
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=50, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0030 begin`);
      const actual: number = translateYOfLoadMore(-100, 50, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0031
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0031
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=100, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0031 begin`);
      const actual: number = translateYOfLoadMore(-100, 100, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0032
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0032
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=2, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0032 begin`);
      const actual: number = translateYOfLoadMore(-100, 2, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0033
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0033
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=3, maxTranslate=0, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0033 begin`);
      const actual: number = translateYOfLoadMore(-100, 3, 0, 0);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0034
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0034
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0034 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, -1);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0035
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0035
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0035 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, 1);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0036
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0036
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0036 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, 2);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0037
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0037
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0037 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, 3);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0038
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0038
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0038 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, 10);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0039
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0039
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0039 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, 100);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0040
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0040
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=-100, maxTranslate=0, sensitivity=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0040 begin`);
      const actual: number = translateYOfLoadMore(-100, -100, 0, 5);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0041
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0041
     * @tc.desc      translateYOfLoadMore(trYBottom=3, deltaY=50, maxTranslate=1, sensitivity=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfLoadMore_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0041 begin`);
      const actual: number = translateYOfLoadMore(3, 50, 1, 3);
      logInfo(`translateYOfLoadMore(trYBottom=3, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0042
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0042
     * @tc.desc      translateYOfLoadMore(trYBottom=50, deltaY=1, maxTranslate=2, sensitivity=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0042 begin`);
      const actual: number = translateYOfLoadMore(50, 1, 2, 10);
      logInfo(`translateYOfLoadMore(trYBottom=50, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0043
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0043
     * @tc.desc      translateYOfLoadMore(trYBottom=-100, deltaY=1, maxTranslate=0, sensitivity=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0043 begin`);
      const actual: number = translateYOfLoadMore(-100, 1, 0, 3);
      logInfo(`translateYOfLoadMore(trYBottom=-100, delt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0044
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0044
     * @tc.desc      translateYOfLoadMore(trYBottom=0, deltaY=-1, maxTranslate=10, sensitivity=2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0044 begin`);
      const actual: number = translateYOfLoadMore(0, -1, 10, 2);
      logInfo(`translateYOfLoadMore(trYBottom=0, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0045
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0045
     * @tc.desc      translateYOfLoadMore(trYBottom=100, deltaY=50, maxTranslate=2, sensitivity=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfLoadMore_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0045 begin`);
      const actual: number = translateYOfLoadMore(100, 50, 2, 2);
      logInfo(`translateYOfLoadMore(trYBottom=100, delta...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0046
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0046
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=100, maxTranslate=100, sensitivity=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0046 begin`);
      const actual: number = translateYOfLoadMore(-1, 100, 100, 1);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0047
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0047
     * @tc.desc      translateYOfLoadMore(trYBottom=0, deltaY=100, maxTranslate=0, sensitivity=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0047 begin`);
      const actual: number = translateYOfLoadMore(0, 100, 0, -1);
      logInfo(`translateYOfLoadMore(trYBottom=0, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0048
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0048
     * @tc.desc      translateYOfLoadMore(trYBottom=3, deltaY=2, maxTranslate=10, sensitivity=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0048 begin`);
      const actual: number = translateYOfLoadMore(3, 2, 10, 0);
      logInfo(`translateYOfLoadMore(trYBottom=3, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0049
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0049
     * @tc.desc      translateYOfLoadMore(trYBottom=100, deltaY=3, maxTranslate=3, sensitivity=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfLoadMore_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0049 begin`);
      const actual: number = translateYOfLoadMore(100, 3, 3, 10);
      logInfo(`translateYOfLoadMore(trYBottom=100, delta...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0050
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0050
     * @tc.desc      translateYOfLoadMore(trYBottom=1, deltaY=-100, maxTranslate=10, sensitivity=3) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0050 begin`);
      const actual: number = translateYOfLoadMore(1, -100, 10, 3);
      logInfo(`translateYOfLoadMore(trYBottom=1, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0051
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0051
     * @tc.desc      translateYOfLoadMore(trYBottom=0, deltaY=1, maxTranslate=10, sensitivity=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0051 begin`);
      const actual: number = translateYOfLoadMore(0, 1, 10, 5);
      logInfo(`translateYOfLoadMore(trYBottom=0, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0052
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0052
     * @tc.desc      translateYOfLoadMore(trYBottom=1, deltaY=50, maxTranslate=5, sensitivity=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0052 begin`);
      const actual: number = translateYOfLoadMore(1, 50, 5, 2);
      logInfo(`translateYOfLoadMore(trYBottom=1, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0053
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0053
     * @tc.desc      translateYOfLoadMore(trYBottom=-1, deltaY=3, maxTranslate=100, sensitivity=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0053 begin`);
      const actual: number = translateYOfLoadMore(-1, 3, 100, 2);
      logInfo(`translateYOfLoadMore(trYBottom=-1, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0054
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0054
     * @tc.desc      translateYOfLoadMore(trYBottom=0, deltaY=50, maxTranslate=5, sensitivity=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0054 begin`);
      const actual: number = translateYOfLoadMore(0, 50, 5, 10);
      logInfo(`translateYOfLoadMore(trYBottom=0, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0055
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0055
     * @tc.desc      translateYOfLoadMore(trYBottom=50, deltaY=50, maxTranslate=10, sensitivity=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfLoadMore_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0055 begin`);
      const actual: number = translateYOfLoadMore(50, 50, 10, 100);
      logInfo(`translateYOfLoadMore(trYBottom=50, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0056
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0056
     * @tc.desc      translateYOfLoadMore(trYBottom=0, deltaY=100, maxTranslate=100, sensitivity=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_TranslateYOfLoadMore_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0056 begin`);
      const actual: number = translateYOfLoadMore(0, 100, 100, 100);
      logInfo(`translateYOfLoadMore(trYBottom=0, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0057
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0057
     * @tc.desc      translateYOfLoadMore(trYBottom=1, deltaY=-100, maxTranslate=5, sensitivity=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_TranslateYOfLoadMore_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0057 begin`);
      const actual: number = translateYOfLoadMore(1, -100, 5, -1);
      logInfo(`translateYOfLoadMore(trYBottom=1, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0058
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0058
     * @tc.desc      translateYOfLoadMore(trYBottom=50, deltaY=2, maxTranslate=5, sensitivity=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfLoadMore_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0058 begin`);
      const actual: number = translateYOfLoadMore(50, 2, 5, 3);
      logInfo(`translateYOfLoadMore(trYBottom=50, deltaY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_TRANSLATE_YOF_LOAD_MORE_0059
     * @tc.name      PullToRefresh_TranslateYOfLoadMore_0059
     * @tc.desc      translateYOfLoadMore(trYBottom=3, deltaY=3, maxTranslate=2, sensitivity=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_TranslateYOfLoadMore_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0059 begin`);
      const actual: number = translateYOfLoadMore(3, 3, 2, 100);
      logInfo(`translateYOfLoadMore(trYBottom=3, deltaY=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TranslateYOfLoadMore_0059 end`);
    });
  });
}
