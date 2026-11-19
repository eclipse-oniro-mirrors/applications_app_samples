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
import { ratioOfIndex } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ratioOfIndex (75 cases). */
export default function ratioOfIndexTest(): void {
  describe('RatioOfIndexTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0001
     * @tc.name      WindowRatio_RatioOfIndex_0001
     * @tc.desc      ratioOfIndex(index=0) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioOfIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0001 begin`);
      const actual: number = ratioOfIndex(0);
      logInfo(`ratioOfIndex(index=0): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0002
     * @tc.name      WindowRatio_RatioOfIndex_0002
     * @tc.desc      ratioOfIndex(index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioOfIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0002 begin`);
      const actual: number = ratioOfIndex(1);
      logInfo(`ratioOfIndex(index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RatioOfIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0003
     * @tc.name      WindowRatio_RatioOfIndex_0003
     * @tc.desc      ratioOfIndex(index=-1) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_RatioOfIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0003 begin`);
      const actual: number = ratioOfIndex(-1);
      logInfo(`ratioOfIndex(index=-1): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0004
     * @tc.name      WindowRatio_RatioOfIndex_0004
     * @tc.desc      ratioOfIndex(index=2) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_RatioOfIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0004 begin`);
      const actual: number = ratioOfIndex(2);
      logInfo(`ratioOfIndex(index=2): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0005
     * @tc.name      WindowRatio_RatioOfIndex_0005
     * @tc.desc      ratioOfIndex(index=5) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0005 begin`);
      const actual: number = ratioOfIndex(5);
      logInfo(`ratioOfIndex(index=5): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0006
     * @tc.name      WindowRatio_RatioOfIndex_0006
     * @tc.desc      ratioOfIndex(index=10) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0006 begin`);
      const actual: number = ratioOfIndex(10);
      logInfo(`ratioOfIndex(index=10): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0007
     * @tc.name      WindowRatio_RatioOfIndex_0007
     * @tc.desc      ratioOfIndex(index=3) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0007 begin`);
      const actual: number = ratioOfIndex(3);
      logInfo(`ratioOfIndex(index=3): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0008
     * @tc.name      WindowRatio_RatioOfIndex_0008
     * @tc.desc      ratioOfIndex(index=100) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0008 begin`);
      const actual: number = ratioOfIndex(100);
      logInfo(`ratioOfIndex(index=100): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0009
     * @tc.name      WindowRatio_RatioOfIndex_0009
     * @tc.desc      ratioOfIndex(index=15) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0009 begin`);
      const actual: number = ratioOfIndex(15);
      logInfo(`ratioOfIndex(index=15): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0010
     * @tc.name      WindowRatio_RatioOfIndex_0010
     * @tc.desc      ratioOfIndex(index=20) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0010 begin`);
      const actual: number = ratioOfIndex(20);
      logInfo(`ratioOfIndex(index=20): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0011
     * @tc.name      WindowRatio_RatioOfIndex_0011
     * @tc.desc      ratioOfIndex(index=25) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0011 begin`);
      const actual: number = ratioOfIndex(25);
      logInfo(`ratioOfIndex(index=25): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0012
     * @tc.name      WindowRatio_RatioOfIndex_0012
     * @tc.desc      ratioOfIndex(index=30) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0012 begin`);
      const actual: number = ratioOfIndex(30);
      logInfo(`ratioOfIndex(index=30): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0013
     * @tc.name      WindowRatio_RatioOfIndex_0013
     * @tc.desc      ratioOfIndex(index=35) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0013 begin`);
      const actual: number = ratioOfIndex(35);
      logInfo(`ratioOfIndex(index=35): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0014
     * @tc.name      WindowRatio_RatioOfIndex_0014
     * @tc.desc      ratioOfIndex(index=40) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0014 begin`);
      const actual: number = ratioOfIndex(40);
      logInfo(`ratioOfIndex(index=40): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0015
     * @tc.name      WindowRatio_RatioOfIndex_0015
     * @tc.desc      ratioOfIndex(index=45) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0015 begin`);
      const actual: number = ratioOfIndex(45);
      logInfo(`ratioOfIndex(index=45): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0016
     * @tc.name      WindowRatio_RatioOfIndex_0016
     * @tc.desc      ratioOfIndex(index=50) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0016 begin`);
      const actual: number = ratioOfIndex(50);
      logInfo(`ratioOfIndex(index=50): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0017
     * @tc.name      WindowRatio_RatioOfIndex_0017
     * @tc.desc      ratioOfIndex(index=55) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0017 begin`);
      const actual: number = ratioOfIndex(55);
      logInfo(`ratioOfIndex(index=55): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0018
     * @tc.name      WindowRatio_RatioOfIndex_0018
     * @tc.desc      ratioOfIndex(index=60) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0018 begin`);
      const actual: number = ratioOfIndex(60);
      logInfo(`ratioOfIndex(index=60): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0019
     * @tc.name      WindowRatio_RatioOfIndex_0019
     * @tc.desc      ratioOfIndex(index=65) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0019 begin`);
      const actual: number = ratioOfIndex(65);
      logInfo(`ratioOfIndex(index=65): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0020
     * @tc.name      WindowRatio_RatioOfIndex_0020
     * @tc.desc      ratioOfIndex(index=70) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0020 begin`);
      const actual: number = ratioOfIndex(70);
      logInfo(`ratioOfIndex(index=70): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0021
     * @tc.name      WindowRatio_RatioOfIndex_0021
     * @tc.desc      ratioOfIndex(index=75) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0021 begin`);
      const actual: number = ratioOfIndex(75);
      logInfo(`ratioOfIndex(index=75): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0022
     * @tc.name      WindowRatio_RatioOfIndex_0022
     * @tc.desc      ratioOfIndex(index=80) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0022 begin`);
      const actual: number = ratioOfIndex(80);
      logInfo(`ratioOfIndex(index=80): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0023
     * @tc.name      WindowRatio_RatioOfIndex_0023
     * @tc.desc      ratioOfIndex(index=85) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0023 begin`);
      const actual: number = ratioOfIndex(85);
      logInfo(`ratioOfIndex(index=85): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0024
     * @tc.name      WindowRatio_RatioOfIndex_0024
     * @tc.desc      ratioOfIndex(index=90) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0024 begin`);
      const actual: number = ratioOfIndex(90);
      logInfo(`ratioOfIndex(index=90): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0025
     * @tc.name      WindowRatio_RatioOfIndex_0025
     * @tc.desc      ratioOfIndex(index=95) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0025 begin`);
      const actual: number = ratioOfIndex(95);
      logInfo(`ratioOfIndex(index=95): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0026
     * @tc.name      WindowRatio_RatioOfIndex_0026
     * @tc.desc      ratioOfIndex(index=105) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0026 begin`);
      const actual: number = ratioOfIndex(105);
      logInfo(`ratioOfIndex(index=105): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0027
     * @tc.name      WindowRatio_RatioOfIndex_0027
     * @tc.desc      ratioOfIndex(index=110) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0027 begin`);
      const actual: number = ratioOfIndex(110);
      logInfo(`ratioOfIndex(index=110): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0028
     * @tc.name      WindowRatio_RatioOfIndex_0028
     * @tc.desc      ratioOfIndex(index=115) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0028 begin`);
      const actual: number = ratioOfIndex(115);
      logInfo(`ratioOfIndex(index=115): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0029
     * @tc.name      WindowRatio_RatioOfIndex_0029
     * @tc.desc      ratioOfIndex(index=120) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0029 begin`);
      const actual: number = ratioOfIndex(120);
      logInfo(`ratioOfIndex(index=120): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0030
     * @tc.name      WindowRatio_RatioOfIndex_0030
     * @tc.desc      ratioOfIndex(index=125) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0030 begin`);
      const actual: number = ratioOfIndex(125);
      logInfo(`ratioOfIndex(index=125): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0031
     * @tc.name      WindowRatio_RatioOfIndex_0031
     * @tc.desc      ratioOfIndex(index=130) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0031 begin`);
      const actual: number = ratioOfIndex(130);
      logInfo(`ratioOfIndex(index=130): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0032
     * @tc.name      WindowRatio_RatioOfIndex_0032
     * @tc.desc      ratioOfIndex(index=135) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0032 begin`);
      const actual: number = ratioOfIndex(135);
      logInfo(`ratioOfIndex(index=135): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0033
     * @tc.name      WindowRatio_RatioOfIndex_0033
     * @tc.desc      ratioOfIndex(index=140) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0033 begin`);
      const actual: number = ratioOfIndex(140);
      logInfo(`ratioOfIndex(index=140): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0034
     * @tc.name      WindowRatio_RatioOfIndex_0034
     * @tc.desc      ratioOfIndex(index=145) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0034 begin`);
      const actual: number = ratioOfIndex(145);
      logInfo(`ratioOfIndex(index=145): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0035
     * @tc.name      WindowRatio_RatioOfIndex_0035
     * @tc.desc      ratioOfIndex(index=150) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0035 begin`);
      const actual: number = ratioOfIndex(150);
      logInfo(`ratioOfIndex(index=150): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0036
     * @tc.name      WindowRatio_RatioOfIndex_0036
     * @tc.desc      ratioOfIndex(index=155) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0036 begin`);
      const actual: number = ratioOfIndex(155);
      logInfo(`ratioOfIndex(index=155): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0037
     * @tc.name      WindowRatio_RatioOfIndex_0037
     * @tc.desc      ratioOfIndex(index=160) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0037 begin`);
      const actual: number = ratioOfIndex(160);
      logInfo(`ratioOfIndex(index=160): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0038
     * @tc.name      WindowRatio_RatioOfIndex_0038
     * @tc.desc      ratioOfIndex(index=165) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0038 begin`);
      const actual: number = ratioOfIndex(165);
      logInfo(`ratioOfIndex(index=165): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0039
     * @tc.name      WindowRatio_RatioOfIndex_0039
     * @tc.desc      ratioOfIndex(index=170) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0039 begin`);
      const actual: number = ratioOfIndex(170);
      logInfo(`ratioOfIndex(index=170): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0040
     * @tc.name      WindowRatio_RatioOfIndex_0040
     * @tc.desc      ratioOfIndex(index=175) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0040 begin`);
      const actual: number = ratioOfIndex(175);
      logInfo(`ratioOfIndex(index=175): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0041
     * @tc.name      WindowRatio_RatioOfIndex_0041
     * @tc.desc      ratioOfIndex(index=180) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0041 begin`);
      const actual: number = ratioOfIndex(180);
      logInfo(`ratioOfIndex(index=180): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0042
     * @tc.name      WindowRatio_RatioOfIndex_0042
     * @tc.desc      ratioOfIndex(index=185) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0042 begin`);
      const actual: number = ratioOfIndex(185);
      logInfo(`ratioOfIndex(index=185): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0043
     * @tc.name      WindowRatio_RatioOfIndex_0043
     * @tc.desc      ratioOfIndex(index=190) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0043 begin`);
      const actual: number = ratioOfIndex(190);
      logInfo(`ratioOfIndex(index=190): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0044
     * @tc.name      WindowRatio_RatioOfIndex_0044
     * @tc.desc      ratioOfIndex(index=195) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0044 begin`);
      const actual: number = ratioOfIndex(195);
      logInfo(`ratioOfIndex(index=195): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0045
     * @tc.name      WindowRatio_RatioOfIndex_0045
     * @tc.desc      ratioOfIndex(index=200) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0045 begin`);
      const actual: number = ratioOfIndex(200);
      logInfo(`ratioOfIndex(index=200): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0046
     * @tc.name      WindowRatio_RatioOfIndex_0046
     * @tc.desc      ratioOfIndex(index=-64) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioOfIndex_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0046 begin`);
      const actual: number = ratioOfIndex(-64);
      logInfo(`ratioOfIndex(index=-64): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0047
     * @tc.name      WindowRatio_RatioOfIndex_0047
     * @tc.desc      ratioOfIndex(index=96.57) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0047 begin`);
      const actual: number = ratioOfIndex(96.57);
      logInfo(`ratioOfIndex(index=96.57): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0048
     * @tc.name      WindowRatio_RatioOfIndex_0048
     * @tc.desc      ratioOfIndex(index=186) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0048 begin`);
      const actual: number = ratioOfIndex(186);
      logInfo(`ratioOfIndex(index=186): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0049
     * @tc.name      WindowRatio_RatioOfIndex_0049
     * @tc.desc      ratioOfIndex(index=84.94) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0049 begin`);
      const actual: number = ratioOfIndex(84.94);
      logInfo(`ratioOfIndex(index=84.94): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0050
     * @tc.name      WindowRatio_RatioOfIndex_0050
     * @tc.desc      ratioOfIndex(index=132) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0050 begin`);
      const actual: number = ratioOfIndex(132);
      logInfo(`ratioOfIndex(index=132): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0051
     * @tc.name      WindowRatio_RatioOfIndex_0051
     * @tc.desc      ratioOfIndex(index=47) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0051 begin`);
      const actual: number = ratioOfIndex(47);
      logInfo(`ratioOfIndex(index=47): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0052
     * @tc.name      WindowRatio_RatioOfIndex_0052
     * @tc.desc      ratioOfIndex(index=79.24) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0052 begin`);
      const actual: number = ratioOfIndex(79.24);
      logInfo(`ratioOfIndex(index=79.24): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0053
     * @tc.name      WindowRatio_RatioOfIndex_0053
     * @tc.desc      ratioOfIndex(index=143) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0053 begin`);
      const actual: number = ratioOfIndex(143);
      logInfo(`ratioOfIndex(index=143): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0054
     * @tc.name      WindowRatio_RatioOfIndex_0054
     * @tc.desc      ratioOfIndex(index=58) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0054 begin`);
      const actual: number = ratioOfIndex(58);
      logInfo(`ratioOfIndex(index=58): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0055
     * @tc.name      WindowRatio_RatioOfIndex_0055
     * @tc.desc      ratioOfIndex(index=11) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0055 begin`);
      const actual: number = ratioOfIndex(11);
      logInfo(`ratioOfIndex(index=11): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0056
     * @tc.name      WindowRatio_RatioOfIndex_0056
     * @tc.desc      ratioOfIndex(index=41) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0056 begin`);
      const actual: number = ratioOfIndex(41);
      logInfo(`ratioOfIndex(index=41): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0057
     * @tc.name      WindowRatio_RatioOfIndex_0057
     * @tc.desc      ratioOfIndex(index=91) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0057 begin`);
      const actual: number = ratioOfIndex(91);
      logInfo(`ratioOfIndex(index=91): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0058
     * @tc.name      WindowRatio_RatioOfIndex_0058
     * @tc.desc      ratioOfIndex(index=12) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0058 begin`);
      const actual: number = ratioOfIndex(12);
      logInfo(`ratioOfIndex(index=12): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0059
     * @tc.name      WindowRatio_RatioOfIndex_0059
     * @tc.desc      ratioOfIndex(index=14.63) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0059 begin`);
      const actual: number = ratioOfIndex(14.63);
      logInfo(`ratioOfIndex(index=14.63): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0060
     * @tc.name      WindowRatio_RatioOfIndex_0060
     * @tc.desc      ratioOfIndex(index=41.59) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0060 begin`);
      const actual: number = ratioOfIndex(41.59);
      logInfo(`ratioOfIndex(index=41.59): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0061
     * @tc.name      WindowRatio_RatioOfIndex_0061
     * @tc.desc      ratioOfIndex(index=27.78) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0061 begin`);
      const actual: number = ratioOfIndex(27.78);
      logInfo(`ratioOfIndex(index=27.78): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0062
     * @tc.name      WindowRatio_RatioOfIndex_0062
     * @tc.desc      ratioOfIndex(index=158) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0062 begin`);
      const actual: number = ratioOfIndex(158);
      logInfo(`ratioOfIndex(index=158): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0063
     * @tc.name      WindowRatio_RatioOfIndex_0063
     * @tc.desc      ratioOfIndex(index=193) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0063 begin`);
      const actual: number = ratioOfIndex(193);
      logInfo(`ratioOfIndex(index=193): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0064
     * @tc.name      WindowRatio_RatioOfIndex_0064
     * @tc.desc      ratioOfIndex(index=-12) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioOfIndex_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0064 begin`);
      const actual: number = ratioOfIndex(-12);
      logInfo(`ratioOfIndex(index=-12): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0065
     * @tc.name      WindowRatio_RatioOfIndex_0065
     * @tc.desc      ratioOfIndex(index=-48) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioOfIndex_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0065 begin`);
      const actual: number = ratioOfIndex(-48);
      logInfo(`ratioOfIndex(index=-48): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0066
     * @tc.name      WindowRatio_RatioOfIndex_0066
     * @tc.desc      ratioOfIndex(index=87.33) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0066 begin`);
      const actual: number = ratioOfIndex(87.33);
      logInfo(`ratioOfIndex(index=87.33): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0067
     * @tc.name      WindowRatio_RatioOfIndex_0067
     * @tc.desc      ratioOfIndex(index=-81) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioOfIndex_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0067 begin`);
      const actual: number = ratioOfIndex(-81);
      logInfo(`ratioOfIndex(index=-81): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0068
     * @tc.name      WindowRatio_RatioOfIndex_0068
     * @tc.desc      ratioOfIndex(index=36.29) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0068 begin`);
      const actual: number = ratioOfIndex(36.29);
      logInfo(`ratioOfIndex(index=36.29): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0069
     * @tc.name      WindowRatio_RatioOfIndex_0069
     * @tc.desc      ratioOfIndex(index=-58) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioOfIndex_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0069 begin`);
      const actual: number = ratioOfIndex(-58);
      logInfo(`ratioOfIndex(index=-58): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0070
     * @tc.name      WindowRatio_RatioOfIndex_0070
     * @tc.desc      ratioOfIndex(index=-28) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioOfIndex_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0070 begin`);
      const actual: number = ratioOfIndex(-28);
      logInfo(`ratioOfIndex(index=-28): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0071
     * @tc.name      WindowRatio_RatioOfIndex_0071
     * @tc.desc      ratioOfIndex(index=96) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0071 begin`);
      const actual: number = ratioOfIndex(96);
      logInfo(`ratioOfIndex(index=96): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0072
     * @tc.name      WindowRatio_RatioOfIndex_0072
     * @tc.desc      ratioOfIndex(index=2.49) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0072 begin`);
      const actual: number = ratioOfIndex(2.49);
      logInfo(`ratioOfIndex(index=2.49): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0073
     * @tc.name      WindowRatio_RatioOfIndex_0073
     * @tc.desc      ratioOfIndex(index=99) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0073 begin`);
      const actual: number = ratioOfIndex(99);
      logInfo(`ratioOfIndex(index=99): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0074
     * @tc.name      WindowRatio_RatioOfIndex_0074
     * @tc.desc      ratioOfIndex(index=98.37) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0074 begin`);
      const actual: number = ratioOfIndex(98.37);
      logInfo(`ratioOfIndex(index=98.37): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_OF_INDEX_0075
     * @tc.name      WindowRatio_RatioOfIndex_0075
     * @tc.desc      ratioOfIndex(index=7.97) returns 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioOfIndex_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioOfIndex_0075 begin`);
      const actual: number = ratioOfIndex(7.97);
      logInfo(`ratioOfIndex(index=7.97): actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}RatioOfIndex_0075 end`);
    });
  });
}
