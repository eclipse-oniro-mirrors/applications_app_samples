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
import { shouldStartLoad } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for shouldStartLoad (50 cases). */
export default function shouldStartLoadTest(): void {
  describe('ShouldStartLoadTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0001
     * @tc.name      PullToRefresh_ShouldStartLoad_0001
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_ShouldStartLoad_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0001 begin`);
      const actual: boolean = shouldStartLoad(-100, 0);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0002
     * @tc.name      PullToRefresh_ShouldStartLoad_0002
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_ShouldStartLoad_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0002 begin`);
      const actual: boolean = shouldStartLoad(-100, -1);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0003
     * @tc.name      PullToRefresh_ShouldStartLoad_0003
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0003 begin`);
      const actual: boolean = shouldStartLoad(-100, 1);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0004
     * @tc.name      PullToRefresh_ShouldStartLoad_0004
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=0.75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0004 begin`);
      const actual: boolean = shouldStartLoad(-100, 0.75);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0005
     * @tc.name      PullToRefresh_ShouldStartLoad_0005
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=1.5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0005 begin`);
      const actual: boolean = shouldStartLoad(-100, 1.5);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0006
     * @tc.name      PullToRefresh_ShouldStartLoad_0006
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=0.375) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0006 begin`);
      const actual: boolean = shouldStartLoad(-100, 0.375);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0007
     * @tc.name      PullToRefresh_ShouldStartLoad_0007
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0007 begin`);
      const actual: boolean = shouldStartLoad(-100, 2);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0008
     * @tc.name      PullToRefresh_ShouldStartLoad_0008
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0008 begin`);
      const actual: boolean = shouldStartLoad(-100, 5);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0009
     * @tc.name      PullToRefresh_ShouldStartLoad_0009
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0009 begin`);
      const actual: boolean = shouldStartLoad(-100, 10);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0010
     * @tc.name      PullToRefresh_ShouldStartLoad_0010
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0010 begin`);
      const actual: boolean = shouldStartLoad(-100, 100);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0011
     * @tc.name      PullToRefresh_ShouldStartLoad_0011
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0011 begin`);
      const actual: boolean = shouldStartLoad(-100, 3);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0012
     * @tc.name      PullToRefresh_ShouldStartLoad_0012
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0012 begin`);
      const actual: boolean = shouldStartLoad(-100, 15);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0013
     * @tc.name      PullToRefresh_ShouldStartLoad_0013
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0013 begin`);
      const actual: boolean = shouldStartLoad(-100, 20);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0014
     * @tc.name      PullToRefresh_ShouldStartLoad_0014
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0014 begin`);
      const actual: boolean = shouldStartLoad(-100, 25);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0015
     * @tc.name      PullToRefresh_ShouldStartLoad_0015
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0015 begin`);
      const actual: boolean = shouldStartLoad(-100, 30);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0016
     * @tc.name      PullToRefresh_ShouldStartLoad_0016
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0016 begin`);
      const actual: boolean = shouldStartLoad(-100, 35);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0017
     * @tc.name      PullToRefresh_ShouldStartLoad_0017
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0017 begin`);
      const actual: boolean = shouldStartLoad(-100, 40);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0018
     * @tc.name      PullToRefresh_ShouldStartLoad_0018
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0018 begin`);
      const actual: boolean = shouldStartLoad(-100, 45);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0019
     * @tc.name      PullToRefresh_ShouldStartLoad_0019
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0019 begin`);
      const actual: boolean = shouldStartLoad(-100, 50);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0020
     * @tc.name      PullToRefresh_ShouldStartLoad_0020
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0020 begin`);
      const actual: boolean = shouldStartLoad(-100, 55);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0021
     * @tc.name      PullToRefresh_ShouldStartLoad_0021
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0021 begin`);
      const actual: boolean = shouldStartLoad(-100, 60);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0022
     * @tc.name      PullToRefresh_ShouldStartLoad_0022
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0022 begin`);
      const actual: boolean = shouldStartLoad(-100, 65);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0023
     * @tc.name      PullToRefresh_ShouldStartLoad_0023
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0023 begin`);
      const actual: boolean = shouldStartLoad(-100, 70);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0024
     * @tc.name      PullToRefresh_ShouldStartLoad_0024
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0024 begin`);
      const actual: boolean = shouldStartLoad(-100, 75);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0025
     * @tc.name      PullToRefresh_ShouldStartLoad_0025
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=80) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0025 begin`);
      const actual: boolean = shouldStartLoad(-100, 80);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0026
     * @tc.name      PullToRefresh_ShouldStartLoad_0026
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=85) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0026 begin`);
      const actual: boolean = shouldStartLoad(-100, 85);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0027
     * @tc.name      PullToRefresh_ShouldStartLoad_0027
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=90) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0027 begin`);
      const actual: boolean = shouldStartLoad(-100, 90);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0028
     * @tc.name      PullToRefresh_ShouldStartLoad_0028
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=95) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0028 begin`);
      const actual: boolean = shouldStartLoad(-100, 95);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0029
     * @tc.name      PullToRefresh_ShouldStartLoad_0029
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=-35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0029 begin`);
      const actual: boolean = shouldStartLoad(-100, -35);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0030
     * @tc.name      PullToRefresh_ShouldStartLoad_0030
     * @tc.desc      shouldStartLoad(trYBottom=-100, maxTranslate=-6) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0030 begin`);
      const actual: boolean = shouldStartLoad(-100, -6);
      logInfo(`shouldStartLoad(trYBottom=-100, maxTransl...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0031
     * @tc.name      PullToRefresh_ShouldStartLoad_0031
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0031 begin`);
      const actual: boolean = shouldStartLoad(-1, 0);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0032
     * @tc.name      PullToRefresh_ShouldStartLoad_0032
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0032 begin`);
      const actual: boolean = shouldStartLoad(-1, 1);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0033
     * @tc.name      PullToRefresh_ShouldStartLoad_0033
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=0.75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0033 begin`);
      const actual: boolean = shouldStartLoad(-1, 0.75);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0034
     * @tc.name      PullToRefresh_ShouldStartLoad_0034
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=1.5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0034 begin`);
      const actual: boolean = shouldStartLoad(-1, 1.5);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0035
     * @tc.name      PullToRefresh_ShouldStartLoad_0035
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=0.375) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0035 begin`);
      const actual: boolean = shouldStartLoad(-1, 0.375);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldStartLoad_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0036
     * @tc.name      PullToRefresh_ShouldStartLoad_0036
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0036 begin`);
      const actual: boolean = shouldStartLoad(-1, 2);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0037
     * @tc.name      PullToRefresh_ShouldStartLoad_0037
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0037 begin`);
      const actual: boolean = shouldStartLoad(-1, 5);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0038
     * @tc.name      PullToRefresh_ShouldStartLoad_0038
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0038 begin`);
      const actual: boolean = shouldStartLoad(-1, 10);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0039
     * @tc.name      PullToRefresh_ShouldStartLoad_0039
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0039 begin`);
      const actual: boolean = shouldStartLoad(-1, 100);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0040
     * @tc.name      PullToRefresh_ShouldStartLoad_0040
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0040 begin`);
      const actual: boolean = shouldStartLoad(-1, -1);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0041
     * @tc.name      PullToRefresh_ShouldStartLoad_0041
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0041 begin`);
      const actual: boolean = shouldStartLoad(-1, 3);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0042
     * @tc.name      PullToRefresh_ShouldStartLoad_0042
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0042 begin`);
      const actual: boolean = shouldStartLoad(-1, 15);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0043
     * @tc.name      PullToRefresh_ShouldStartLoad_0043
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0043 begin`);
      const actual: boolean = shouldStartLoad(-1, 20);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0044
     * @tc.name      PullToRefresh_ShouldStartLoad_0044
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0044 begin`);
      const actual: boolean = shouldStartLoad(-1, 25);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0045
     * @tc.name      PullToRefresh_ShouldStartLoad_0045
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0045 begin`);
      const actual: boolean = shouldStartLoad(-1, 30);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0046
     * @tc.name      PullToRefresh_ShouldStartLoad_0046
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0046 begin`);
      const actual: boolean = shouldStartLoad(-1, 35);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0047
     * @tc.name      PullToRefresh_ShouldStartLoad_0047
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0047 begin`);
      const actual: boolean = shouldStartLoad(-1, 40);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0048
     * @tc.name      PullToRefresh_ShouldStartLoad_0048
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0048 begin`);
      const actual: boolean = shouldStartLoad(-1, 45);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0049
     * @tc.name      PullToRefresh_ShouldStartLoad_0049
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0049 begin`);
      const actual: boolean = shouldStartLoad(-1, 50);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SHOULD_START_LOAD_0050
     * @tc.name      PullToRefresh_ShouldStartLoad_0050
     * @tc.desc      shouldStartLoad(trYBottom=-1, maxTranslate=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ShouldStartLoad_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldStartLoad_0050 begin`);
      const actual: boolean = shouldStartLoad(-1, 55);
      logInfo(`shouldStartLoad(trYBottom=-1, maxTranslat...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldStartLoad_0050 end`);
    });
  });
}
