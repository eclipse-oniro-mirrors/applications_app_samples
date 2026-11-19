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
import { matchesRatio } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for matchesRatio (50 cases). */
export default function matchesRatioTest(): void {
  describe('MatchesRatioTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0001
     * @tc.name      WindowRatio_MatchesRatio_0001
     * @tc.desc      matchesRatio(width=0, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_MatchesRatio_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MatchesRatio_0001 begin`);
      const actual: boolean = matchesRatio(0, 0, 0);
      logInfo(`matchesRatio(width=0, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0002
     * @tc.name      WindowRatio_MatchesRatio_0002
     * @tc.desc      matchesRatio(width=100, height=3, ratio=41.98) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_MatchesRatio_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MatchesRatio_0002 begin`);
      const actual: boolean = matchesRatio(100, 3, 41.98);
      logInfo(`matchesRatio(width=100, height=3, ratio=4...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}MatchesRatio_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0003
     * @tc.name      WindowRatio_MatchesRatio_0003
     * @tc.desc      matchesRatio(width=1, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0003 begin`);
      const actual: boolean = matchesRatio(1, 0, 0);
      logInfo(`matchesRatio(width=1, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0004
     * @tc.name      WindowRatio_MatchesRatio_0004
     * @tc.desc      matchesRatio(width=-1, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0004 begin`);
      const actual: boolean = matchesRatio(-1, 0, 0);
      logInfo(`matchesRatio(width=-1, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0005
     * @tc.name      WindowRatio_MatchesRatio_0005
     * @tc.desc      matchesRatio(width=2, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0005 begin`);
      const actual: boolean = matchesRatio(2, 0, 0);
      logInfo(`matchesRatio(width=2, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0006
     * @tc.name      WindowRatio_MatchesRatio_0006
     * @tc.desc      matchesRatio(width=100, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0006 begin`);
      const actual: boolean = matchesRatio(100, 0, 0);
      logInfo(`matchesRatio(width=100, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0007
     * @tc.name      WindowRatio_MatchesRatio_0007
     * @tc.desc      matchesRatio(width=360, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0007 begin`);
      const actual: boolean = matchesRatio(360, 0, 0);
      logInfo(`matchesRatio(width=360, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0008
     * @tc.name      WindowRatio_MatchesRatio_0008
     * @tc.desc      matchesRatio(width=720, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0008 begin`);
      const actual: boolean = matchesRatio(720, 0, 0);
      logInfo(`matchesRatio(width=720, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0009
     * @tc.name      WindowRatio_MatchesRatio_0009
     * @tc.desc      matchesRatio(width=1080, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0009 begin`);
      const actual: boolean = matchesRatio(1080, 0, 0);
      logInfo(`matchesRatio(width=1080, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0010
     * @tc.name      WindowRatio_MatchesRatio_0010
     * @tc.desc      matchesRatio(width=1920, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0010 begin`);
      const actual: boolean = matchesRatio(1920, 0, 0);
      logInfo(`matchesRatio(width=1920, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0011
     * @tc.name      WindowRatio_MatchesRatio_0011
     * @tc.desc      matchesRatio(width=3, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0011 begin`);
      const actual: boolean = matchesRatio(3, 0, 0);
      logInfo(`matchesRatio(width=3, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0012
     * @tc.name      WindowRatio_MatchesRatio_0012
     * @tc.desc      matchesRatio(width=10, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0012 begin`);
      const actual: boolean = matchesRatio(10, 0, 0);
      logInfo(`matchesRatio(width=10, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0013
     * @tc.name      WindowRatio_MatchesRatio_0013
     * @tc.desc      matchesRatio(width=96, height=0, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0013 begin`);
      const actual: boolean = matchesRatio(96, 0, 0);
      logInfo(`matchesRatio(width=96, height=0, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0014
     * @tc.name      WindowRatio_MatchesRatio_0014
     * @tc.desc      matchesRatio(width=0, height=1, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0014 begin`);
      const actual: boolean = matchesRatio(0, 1, 0);
      logInfo(`matchesRatio(width=0, height=1, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0015
     * @tc.name      WindowRatio_MatchesRatio_0015
     * @tc.desc      matchesRatio(width=0, height=-1, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0015 begin`);
      const actual: boolean = matchesRatio(0, -1, 0);
      logInfo(`matchesRatio(width=0, height=-1, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0016
     * @tc.name      WindowRatio_MatchesRatio_0016
     * @tc.desc      matchesRatio(width=0, height=2, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0016 begin`);
      const actual: boolean = matchesRatio(0, 2, 0);
      logInfo(`matchesRatio(width=0, height=2, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0017
     * @tc.name      WindowRatio_MatchesRatio_0017
     * @tc.desc      matchesRatio(width=0, height=100, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0017 begin`);
      const actual: boolean = matchesRatio(0, 100, 0);
      logInfo(`matchesRatio(width=0, height=100, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0018
     * @tc.name      WindowRatio_MatchesRatio_0018
     * @tc.desc      matchesRatio(width=0, height=360, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0018 begin`);
      const actual: boolean = matchesRatio(0, 360, 0);
      logInfo(`matchesRatio(width=0, height=360, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0019
     * @tc.name      WindowRatio_MatchesRatio_0019
     * @tc.desc      matchesRatio(width=0, height=720, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0019 begin`);
      const actual: boolean = matchesRatio(0, 720, 0);
      logInfo(`matchesRatio(width=0, height=720, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0020
     * @tc.name      WindowRatio_MatchesRatio_0020
     * @tc.desc      matchesRatio(width=0, height=1080, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0020 begin`);
      const actual: boolean = matchesRatio(0, 1080, 0);
      logInfo(`matchesRatio(width=0, height=1080, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0021
     * @tc.name      WindowRatio_MatchesRatio_0021
     * @tc.desc      matchesRatio(width=0, height=1920, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0021 begin`);
      const actual: boolean = matchesRatio(0, 1920, 0);
      logInfo(`matchesRatio(width=0, height=1920, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0022
     * @tc.name      WindowRatio_MatchesRatio_0022
     * @tc.desc      matchesRatio(width=0, height=3, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0022 begin`);
      const actual: boolean = matchesRatio(0, 3, 0);
      logInfo(`matchesRatio(width=0, height=3, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0023
     * @tc.name      WindowRatio_MatchesRatio_0023
     * @tc.desc      matchesRatio(width=0, height=10, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0023 begin`);
      const actual: boolean = matchesRatio(0, 10, 0);
      logInfo(`matchesRatio(width=0, height=10, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0024
     * @tc.name      WindowRatio_MatchesRatio_0024
     * @tc.desc      matchesRatio(width=0, height=96, ratio=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0024 begin`);
      const actual: boolean = matchesRatio(0, 96, 0);
      logInfo(`matchesRatio(width=0, height=96, ratio=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0025
     * @tc.name      WindowRatio_MatchesRatio_0025
     * @tc.desc      matchesRatio(width=0, height=0, ratio=0.25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0025 begin`);
      const actual: boolean = matchesRatio(0, 0, 0.25);
      logInfo(`matchesRatio(width=0, height=0, ratio=0.25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0026
     * @tc.name      WindowRatio_MatchesRatio_0026
     * @tc.desc      matchesRatio(width=0, height=0, ratio=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0026 begin`);
      const actual: boolean = matchesRatio(0, 0, -1);
      logInfo(`matchesRatio(width=0, height=0, ratio=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0027
     * @tc.name      WindowRatio_MatchesRatio_0027
     * @tc.desc      matchesRatio(width=0, height=0, ratio=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0027 begin`);
      const actual: boolean = matchesRatio(0, 0, 1);
      logInfo(`matchesRatio(width=0, height=0, ratio=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0028
     * @tc.name      WindowRatio_MatchesRatio_0028
     * @tc.desc      matchesRatio(width=0, height=0, ratio=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0028 begin`);
      const actual: boolean = matchesRatio(0, 0, 2);
      logInfo(`matchesRatio(width=0, height=0, ratio=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0029
     * @tc.name      WindowRatio_MatchesRatio_0029
     * @tc.desc      matchesRatio(width=0, height=0, ratio=0.5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0029 begin`);
      const actual: boolean = matchesRatio(0, 0, 0.5);
      logInfo(`matchesRatio(width=0, height=0, ratio=0.5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0030
     * @tc.name      WindowRatio_MatchesRatio_0030
     * @tc.desc      matchesRatio(width=0, height=0, ratio=1.5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0030 begin`);
      const actual: boolean = matchesRatio(0, 0, 1.5);
      logInfo(`matchesRatio(width=0, height=0, ratio=1.5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0031
     * @tc.name      WindowRatio_MatchesRatio_0031
     * @tc.desc      matchesRatio(width=0, height=0, ratio=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0031 begin`);
      const actual: boolean = matchesRatio(0, 0, 3);
      logInfo(`matchesRatio(width=0, height=0, ratio=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0032
     * @tc.name      WindowRatio_MatchesRatio_0032
     * @tc.desc      matchesRatio(width=0, height=0, ratio=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0032 begin`);
      const actual: boolean = matchesRatio(0, 0, 10);
      logInfo(`matchesRatio(width=0, height=0, ratio=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0033
     * @tc.name      WindowRatio_MatchesRatio_0033
     * @tc.desc      matchesRatio(width=0, height=0, ratio=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0033 begin`);
      const actual: boolean = matchesRatio(0, 0, 100);
      logInfo(`matchesRatio(width=0, height=0, ratio=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0034
     * @tc.name      WindowRatio_MatchesRatio_0034
     * @tc.desc      matchesRatio(width=0, height=0, ratio=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0034 begin`);
      const actual: boolean = matchesRatio(0, 0, 5);
      logInfo(`matchesRatio(width=0, height=0, ratio=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0035
     * @tc.name      WindowRatio_MatchesRatio_0035
     * @tc.desc      matchesRatio(width=0, height=0, ratio=41.98) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0035 begin`);
      const actual: boolean = matchesRatio(0, 0, 41.98);
      logInfo(`matchesRatio(width=0, height=0, ratio=41.98): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0036
     * @tc.name      WindowRatio_MatchesRatio_0036
     * @tc.desc      matchesRatio(width=1920, height=2, ratio=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0036 begin`);
      const actual: boolean = matchesRatio(1920, 2, 10);
      logInfo(`matchesRatio(width=1920, height=2, ratio=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0037
     * @tc.name      WindowRatio_MatchesRatio_0037
     * @tc.desc      matchesRatio(width=720, height=360, ratio=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0037 begin`);
      const actual: boolean = matchesRatio(720, 360, 5);
      logInfo(`matchesRatio(width=720, height=360, ratio=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0038
     * @tc.name      WindowRatio_MatchesRatio_0038
     * @tc.desc      matchesRatio(width=1, height=100, ratio=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0038 begin`);
      const actual: boolean = matchesRatio(1, 100, 100);
      logInfo(`matchesRatio(width=1, height=100, ratio=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0039
     * @tc.name      WindowRatio_MatchesRatio_0039
     * @tc.desc      matchesRatio(width=720, height=96, ratio=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0039 begin`);
      const actual: boolean = matchesRatio(720, 96, 3);
      logInfo(`matchesRatio(width=720, height=96, ratio=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0040
     * @tc.name      WindowRatio_MatchesRatio_0040
     * @tc.desc      matchesRatio(width=1920, height=96, ratio=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0040 begin`);
      const actual: boolean = matchesRatio(1920, 96, 1);
      logInfo(`matchesRatio(width=1920, height=96, ratio=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0041
     * @tc.name      WindowRatio_MatchesRatio_0041
     * @tc.desc      matchesRatio(width=-1, height=3, ratio=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0041 begin`);
      const actual: boolean = matchesRatio(-1, 3, 10);
      logInfo(`matchesRatio(width=-1, height=3, ratio=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0042
     * @tc.name      WindowRatio_MatchesRatio_0042
     * @tc.desc      matchesRatio(width=2, height=100, ratio=41.98) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0042 begin`);
      const actual: boolean = matchesRatio(2, 100, 41.98);
      logInfo(`matchesRatio(width=2, height=100, ratio=4...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0043
     * @tc.name      WindowRatio_MatchesRatio_0043
     * @tc.desc      matchesRatio(width=360, height=720, ratio=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0043 begin`);
      const actual: boolean = matchesRatio(360, 720, 3);
      logInfo(`matchesRatio(width=360, height=720, ratio=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0044
     * @tc.name      WindowRatio_MatchesRatio_0044
     * @tc.desc      matchesRatio(width=360, height=360, ratio=41.98) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0044 begin`);
      const actual: boolean = matchesRatio(360, 360, 41.98);
      logInfo(`matchesRatio(width=360, height=360, ratio...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0045
     * @tc.name      WindowRatio_MatchesRatio_0045
     * @tc.desc      matchesRatio(width=1920, height=1, ratio=0.5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0045 begin`);
      const actual: boolean = matchesRatio(1920, 1, 0.5);
      logInfo(`matchesRatio(width=1920, height=1, ratio=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0046
     * @tc.name      WindowRatio_MatchesRatio_0046
     * @tc.desc      matchesRatio(width=1, height=3, ratio=0.5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0046 begin`);
      const actual: boolean = matchesRatio(1, 3, 0.5);
      logInfo(`matchesRatio(width=1, height=3, ratio=0.5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}MatchesRatio_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0047
     * @tc.name      WindowRatio_MatchesRatio_0047
     * @tc.desc      matchesRatio(width=-1, height=2, ratio=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0047 begin`);
      const actual: boolean = matchesRatio(-1, 2, 3);
      logInfo(`matchesRatio(width=-1, height=2, ratio=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0048
     * @tc.name      WindowRatio_MatchesRatio_0048
     * @tc.desc      matchesRatio(width=1080, height=100, ratio=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0048 begin`);
      const actual: boolean = matchesRatio(1080, 100, 100);
      logInfo(`matchesRatio(width=1080, height=100, rati...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0049
     * @tc.name      WindowRatio_MatchesRatio_0049
     * @tc.desc      matchesRatio(width=10, height=96, ratio=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_MatchesRatio_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MatchesRatio_0049 begin`);
      const actual: boolean = matchesRatio(10, 96, 1);
      logInfo(`matchesRatio(width=10, height=96, ratio=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}MatchesRatio_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_MATCHES_RATIO_0050
     * @tc.name      WindowRatio_MatchesRatio_0050
     * @tc.desc      matchesRatio(width=0, height=1, ratio=1.5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_MatchesRatio_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchesRatio_0050 begin`);
      const actual: boolean = matchesRatio(0, 1, 1.5);
      logInfo(`matchesRatio(width=0, height=1, ratio=1.5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}MatchesRatio_0050 end`);
    });
  });
}
