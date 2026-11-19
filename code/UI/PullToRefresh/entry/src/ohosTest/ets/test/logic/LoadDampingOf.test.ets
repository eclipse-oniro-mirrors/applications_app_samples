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
import { loadDampingOf } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for loadDampingOf (59 cases). */
export default function loadDampingOfTest(): void {
  describe('LoadDampingOfTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0001
     * @tc.name      PullToRefresh_LoadDampingOf_0001
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadDampingOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0001 begin`);
      const actual: number = loadDampingOf(-100, 0);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0002
     * @tc.name      PullToRefresh_LoadDampingOf_0002
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-0.2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadDampingOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0002 begin`);
      const actual: number = loadDampingOf(-100, -0.2);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0003
     * @tc.name      PullToRefresh_LoadDampingOf_0003
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=2) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0003 begin`);
      const actual: number = loadDampingOf(-1, 2);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=2): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0004
     * @tc.name      PullToRefresh_LoadDampingOf_0004
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=1.6) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0004 begin`);
      const actual: number = loadDampingOf(-1, 1.6);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0005
     * @tc.name      PullToRefresh_LoadDampingOf_0005
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=5) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0005 begin`);
      const actual: number = loadDampingOf(-1, 5);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=5): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0006
     * @tc.name      PullToRefresh_LoadDampingOf_0006
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=1) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0006 begin`);
      const actual: number = loadDampingOf(-100, 1);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0007
     * @tc.name      PullToRefresh_LoadDampingOf_0007
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-0.4) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0007 begin`);
      const actual: number = loadDampingOf(-100, -0.4);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0008
     * @tc.name      PullToRefresh_LoadDampingOf_0008
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-0.1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0008 begin`);
      const actual: number = loadDampingOf(-100, -0.1);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0009
     * @tc.name      PullToRefresh_LoadDampingOf_0009
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=2) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0009 begin`);
      const actual: number = loadDampingOf(-100, 2);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0010
     * @tc.name      PullToRefresh_LoadDampingOf_0010
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-0.8) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0010 begin`);
      const actual: number = loadDampingOf(-100, -0.8);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0011
     * @tc.name      PullToRefresh_LoadDampingOf_0011
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0.8) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0011 begin`);
      const actual: number = loadDampingOf(-100, 0.8);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0012
     * @tc.name      PullToRefresh_LoadDampingOf_0012
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=1.6) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0012 begin`);
      const actual: number = loadDampingOf(-100, 1.6);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0013
     * @tc.name      PullToRefresh_LoadDampingOf_0013
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0.4) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0013 begin`);
      const actual: number = loadDampingOf(-100, 0.4);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0014
     * @tc.name      PullToRefresh_LoadDampingOf_0014
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-0.6) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0014 begin`);
      const actual: number = loadDampingOf(-100, -0.6);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0015
     * @tc.name      PullToRefresh_LoadDampingOf_0015
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-1.2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0015 begin`);
      const actual: number = loadDampingOf(-100, -1.2);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0016
     * @tc.name      PullToRefresh_LoadDampingOf_0016
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-0.3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0016 begin`);
      const actual: number = loadDampingOf(-100, -0.3);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0017
     * @tc.name      PullToRefresh_LoadDampingOf_0017
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0.6) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0017 begin`);
      const actual: number = loadDampingOf(-100, 0.6);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0018
     * @tc.name      PullToRefresh_LoadDampingOf_0018
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=1.2) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0018 begin`);
      const actual: number = loadDampingOf(-100, 1.2);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0019
     * @tc.name      PullToRefresh_LoadDampingOf_0019
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0.3) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0019 begin`);
      const actual: number = loadDampingOf(-100, 0.3);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0020
     * @tc.name      PullToRefresh_LoadDampingOf_0020
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-1.6) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0020 begin`);
      const actual: number = loadDampingOf(-100, -1.6);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0021
     * @tc.name      PullToRefresh_LoadDampingOf_0021
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0.2) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0021 begin`);
      const actual: number = loadDampingOf(-100, 0.2);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0022
     * @tc.name      PullToRefresh_LoadDampingOf_0022
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0.1) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0022 begin`);
      const actual: number = loadDampingOf(-100, 0.1);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0023
     * @tc.name      PullToRefresh_LoadDampingOf_0023
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=5) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0023 begin`);
      const actual: number = loadDampingOf(-100, 5);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0024
     * @tc.name      PullToRefresh_LoadDampingOf_0024
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=10) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0024 begin`);
      const actual: number = loadDampingOf(-100, 10);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0025
     * @tc.name      PullToRefresh_LoadDampingOf_0025
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=100) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0025 begin`);
      const actual: number = loadDampingOf(-100, 100);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0026
     * @tc.name      PullToRefresh_LoadDampingOf_0026
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0026 begin`);
      const actual: number = loadDampingOf(-100, -1);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0027
     * @tc.name      PullToRefresh_LoadDampingOf_0027
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=3) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0027 begin`);
      const actual: number = loadDampingOf(-100, 3);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0028
     * @tc.name      PullToRefresh_LoadDampingOf_0028
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=15) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0028 begin`);
      const actual: number = loadDampingOf(-100, 15);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0029
     * @tc.name      PullToRefresh_LoadDampingOf_0029
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=20) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0029 begin`);
      const actual: number = loadDampingOf(-100, 20);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0030
     * @tc.name      PullToRefresh_LoadDampingOf_0030
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=25) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0030 begin`);
      const actual: number = loadDampingOf(-100, 25);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0031
     * @tc.name      PullToRefresh_LoadDampingOf_0031
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=30) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0031 begin`);
      const actual: number = loadDampingOf(-100, 30);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0032
     * @tc.name      PullToRefresh_LoadDampingOf_0032
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=0.21) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0032 begin`);
      const actual: number = loadDampingOf(-100, 0.21);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0033
     * @tc.name      PullToRefresh_LoadDampingOf_0033
     * @tc.desc      loadDampingOf(trYBottom=-100, maxTranslate=-59) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0033 begin`);
      const actual: number = loadDampingOf(-100, -59);
      logInfo(`loadDampingOf(trYBottom=-100, maxTranslat...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0034
     * @tc.name      PullToRefresh_LoadDampingOf_0034
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0034 begin`);
      const actual: number = loadDampingOf(-1, 0);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=0): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0035
     * @tc.name      PullToRefresh_LoadDampingOf_0035
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=1) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0035 begin`);
      const actual: number = loadDampingOf(-1, 1);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=1): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0036
     * @tc.name      PullToRefresh_LoadDampingOf_0036
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-0.2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0036 begin`);
      const actual: number = loadDampingOf(-1, -0.2);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0037
     * @tc.name      PullToRefresh_LoadDampingOf_0037
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-0.4) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0037 begin`);
      const actual: number = loadDampingOf(-1, -0.4);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0038
     * @tc.name      PullToRefresh_LoadDampingOf_0038
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-0.1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0038 begin`);
      const actual: number = loadDampingOf(-1, -0.1);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0039
     * @tc.name      PullToRefresh_LoadDampingOf_0039
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-0.8) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0039 begin`);
      const actual: number = loadDampingOf(-1, -0.8);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0040
     * @tc.name      PullToRefresh_LoadDampingOf_0040
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0.8) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0040 begin`);
      const actual: number = loadDampingOf(-1, 0.8);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0041
     * @tc.name      PullToRefresh_LoadDampingOf_0041
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0.4) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0041 begin`);
      const actual: number = loadDampingOf(-1, 0.4);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0042
     * @tc.name      PullToRefresh_LoadDampingOf_0042
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-0.6) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0042 begin`);
      const actual: number = loadDampingOf(-1, -0.6);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0043
     * @tc.name      PullToRefresh_LoadDampingOf_0043
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-1.2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0043 begin`);
      const actual: number = loadDampingOf(-1, -1.2);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0044
     * @tc.name      PullToRefresh_LoadDampingOf_0044
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-0.3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0044 begin`);
      const actual: number = loadDampingOf(-1, -0.3);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0045
     * @tc.name      PullToRefresh_LoadDampingOf_0045
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0.6) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0045 begin`);
      const actual: number = loadDampingOf(-1, 0.6);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0046
     * @tc.name      PullToRefresh_LoadDampingOf_0046
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=1.2) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0046 begin`);
      const actual: number = loadDampingOf(-1, 1.2);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0047
     * @tc.name      PullToRefresh_LoadDampingOf_0047
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0.3) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0047 begin`);
      const actual: number = loadDampingOf(-1, 0.3);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0048
     * @tc.name      PullToRefresh_LoadDampingOf_0048
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-1.6) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0048 begin`);
      const actual: number = loadDampingOf(-1, -1.6);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0049
     * @tc.name      PullToRefresh_LoadDampingOf_0049
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0.2) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0049 begin`);
      const actual: number = loadDampingOf(-1, 0.2);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0050
     * @tc.name      PullToRefresh_LoadDampingOf_0050
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0.1) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0050 begin`);
      const actual: number = loadDampingOf(-1, 0.1);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0051
     * @tc.name      PullToRefresh_LoadDampingOf_0051
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0051 begin`);
      const actual: number = loadDampingOf(-1, 10);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0052
     * @tc.name      PullToRefresh_LoadDampingOf_0052
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0052 begin`);
      const actual: number = loadDampingOf(-1, 100);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0053
     * @tc.name      PullToRefresh_LoadDampingOf_0053
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0053 begin`);
      const actual: number = loadDampingOf(-1, -1);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0054
     * @tc.name      PullToRefresh_LoadDampingOf_0054
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=3) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0054 begin`);
      const actual: number = loadDampingOf(-1, 3);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=3): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0055
     * @tc.name      PullToRefresh_LoadDampingOf_0055
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0055 begin`);
      const actual: number = loadDampingOf(-1, 15);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0056
     * @tc.name      PullToRefresh_LoadDampingOf_0056
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0056 begin`);
      const actual: number = loadDampingOf(-1, 20);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0057
     * @tc.name      PullToRefresh_LoadDampingOf_0057
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0057 begin`);
      const actual: number = loadDampingOf(-1, 25);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0058
     * @tc.name      PullToRefresh_LoadDampingOf_0058
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0058 begin`);
      const actual: number = loadDampingOf(-1, 30);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadDampingOf_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOAD_DAMPING_OF_0059
     * @tc.name      PullToRefresh_LoadDampingOf_0059
     * @tc.desc      loadDampingOf(trYBottom=-1, maxTranslate=0.21) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadDampingOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadDampingOf_0059 begin`);
      const actual: number = loadDampingOf(-1, 0.21);
      logInfo(`loadDampingOf(trYBottom=-1, maxTranslate=...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadDampingOf_0059 end`);
    });
  });
}
