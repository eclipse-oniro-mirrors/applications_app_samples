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
import { ratioLabelOfIndex } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ratioLabelOfIndex (75 cases). */
export default function ratioLabelOfIndexTest(): void {
  describe('RatioLabelOfIndexTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0001
     * @tc.name      WindowRatio_RatioLabelOfIndex_0001
     * @tc.desc      ratioLabelOfIndex(index=0) returns "4:3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioLabelOfIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0001 begin`);
      const actual: string = ratioLabelOfIndex(0);
      logInfo(`ratioLabelOfIndex(index=0): actual=${actual}`);
      expect(actual).assertEqual('4:3');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0002
     * @tc.name      WindowRatio_RatioLabelOfIndex_0002
     * @tc.desc      ratioLabelOfIndex(index=1) returns "1:1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioLabelOfIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0002 begin`);
      const actual: string = ratioLabelOfIndex(1);
      logInfo(`ratioLabelOfIndex(index=1): actual=${actual}`);
      expect(actual).assertEqual('1:1');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0003
     * @tc.name      WindowRatio_RatioLabelOfIndex_0003
     * @tc.desc      ratioLabelOfIndex(index=-1) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_RatioLabelOfIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0003 begin`);
      const actual: string = ratioLabelOfIndex(-1);
      logInfo(`ratioLabelOfIndex(index=-1): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0004
     * @tc.name      WindowRatio_RatioLabelOfIndex_0004
     * @tc.desc      ratioLabelOfIndex(index=2) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_RatioLabelOfIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0004 begin`);
      const actual: string = ratioLabelOfIndex(2);
      logInfo(`ratioLabelOfIndex(index=2): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0005
     * @tc.name      WindowRatio_RatioLabelOfIndex_0005
     * @tc.desc      ratioLabelOfIndex(index=5) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0005 begin`);
      const actual: string = ratioLabelOfIndex(5);
      logInfo(`ratioLabelOfIndex(index=5): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0006
     * @tc.name      WindowRatio_RatioLabelOfIndex_0006
     * @tc.desc      ratioLabelOfIndex(index=10) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0006 begin`);
      const actual: string = ratioLabelOfIndex(10);
      logInfo(`ratioLabelOfIndex(index=10): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0007
     * @tc.name      WindowRatio_RatioLabelOfIndex_0007
     * @tc.desc      ratioLabelOfIndex(index=3) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0007 begin`);
      const actual: string = ratioLabelOfIndex(3);
      logInfo(`ratioLabelOfIndex(index=3): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0008
     * @tc.name      WindowRatio_RatioLabelOfIndex_0008
     * @tc.desc      ratioLabelOfIndex(index=100) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0008 begin`);
      const actual: string = ratioLabelOfIndex(100);
      logInfo(`ratioLabelOfIndex(index=100): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0009
     * @tc.name      WindowRatio_RatioLabelOfIndex_0009
     * @tc.desc      ratioLabelOfIndex(index=15) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0009 begin`);
      const actual: string = ratioLabelOfIndex(15);
      logInfo(`ratioLabelOfIndex(index=15): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0010
     * @tc.name      WindowRatio_RatioLabelOfIndex_0010
     * @tc.desc      ratioLabelOfIndex(index=20) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0010 begin`);
      const actual: string = ratioLabelOfIndex(20);
      logInfo(`ratioLabelOfIndex(index=20): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0011
     * @tc.name      WindowRatio_RatioLabelOfIndex_0011
     * @tc.desc      ratioLabelOfIndex(index=25) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0011 begin`);
      const actual: string = ratioLabelOfIndex(25);
      logInfo(`ratioLabelOfIndex(index=25): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0012
     * @tc.name      WindowRatio_RatioLabelOfIndex_0012
     * @tc.desc      ratioLabelOfIndex(index=30) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0012 begin`);
      const actual: string = ratioLabelOfIndex(30);
      logInfo(`ratioLabelOfIndex(index=30): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0013
     * @tc.name      WindowRatio_RatioLabelOfIndex_0013
     * @tc.desc      ratioLabelOfIndex(index=35) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0013 begin`);
      const actual: string = ratioLabelOfIndex(35);
      logInfo(`ratioLabelOfIndex(index=35): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0014
     * @tc.name      WindowRatio_RatioLabelOfIndex_0014
     * @tc.desc      ratioLabelOfIndex(index=40) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0014 begin`);
      const actual: string = ratioLabelOfIndex(40);
      logInfo(`ratioLabelOfIndex(index=40): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0015
     * @tc.name      WindowRatio_RatioLabelOfIndex_0015
     * @tc.desc      ratioLabelOfIndex(index=45) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0015 begin`);
      const actual: string = ratioLabelOfIndex(45);
      logInfo(`ratioLabelOfIndex(index=45): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0016
     * @tc.name      WindowRatio_RatioLabelOfIndex_0016
     * @tc.desc      ratioLabelOfIndex(index=50) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0016 begin`);
      const actual: string = ratioLabelOfIndex(50);
      logInfo(`ratioLabelOfIndex(index=50): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0017
     * @tc.name      WindowRatio_RatioLabelOfIndex_0017
     * @tc.desc      ratioLabelOfIndex(index=55) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0017 begin`);
      const actual: string = ratioLabelOfIndex(55);
      logInfo(`ratioLabelOfIndex(index=55): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0018
     * @tc.name      WindowRatio_RatioLabelOfIndex_0018
     * @tc.desc      ratioLabelOfIndex(index=60) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0018 begin`);
      const actual: string = ratioLabelOfIndex(60);
      logInfo(`ratioLabelOfIndex(index=60): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0019
     * @tc.name      WindowRatio_RatioLabelOfIndex_0019
     * @tc.desc      ratioLabelOfIndex(index=65) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0019 begin`);
      const actual: string = ratioLabelOfIndex(65);
      logInfo(`ratioLabelOfIndex(index=65): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0020
     * @tc.name      WindowRatio_RatioLabelOfIndex_0020
     * @tc.desc      ratioLabelOfIndex(index=70) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0020 begin`);
      const actual: string = ratioLabelOfIndex(70);
      logInfo(`ratioLabelOfIndex(index=70): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0021
     * @tc.name      WindowRatio_RatioLabelOfIndex_0021
     * @tc.desc      ratioLabelOfIndex(index=75) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0021 begin`);
      const actual: string = ratioLabelOfIndex(75);
      logInfo(`ratioLabelOfIndex(index=75): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0022
     * @tc.name      WindowRatio_RatioLabelOfIndex_0022
     * @tc.desc      ratioLabelOfIndex(index=80) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0022 begin`);
      const actual: string = ratioLabelOfIndex(80);
      logInfo(`ratioLabelOfIndex(index=80): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0023
     * @tc.name      WindowRatio_RatioLabelOfIndex_0023
     * @tc.desc      ratioLabelOfIndex(index=85) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0023 begin`);
      const actual: string = ratioLabelOfIndex(85);
      logInfo(`ratioLabelOfIndex(index=85): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0024
     * @tc.name      WindowRatio_RatioLabelOfIndex_0024
     * @tc.desc      ratioLabelOfIndex(index=90) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0024 begin`);
      const actual: string = ratioLabelOfIndex(90);
      logInfo(`ratioLabelOfIndex(index=90): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0025
     * @tc.name      WindowRatio_RatioLabelOfIndex_0025
     * @tc.desc      ratioLabelOfIndex(index=95) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0025 begin`);
      const actual: string = ratioLabelOfIndex(95);
      logInfo(`ratioLabelOfIndex(index=95): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0026
     * @tc.name      WindowRatio_RatioLabelOfIndex_0026
     * @tc.desc      ratioLabelOfIndex(index=105) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0026 begin`);
      const actual: string = ratioLabelOfIndex(105);
      logInfo(`ratioLabelOfIndex(index=105): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0027
     * @tc.name      WindowRatio_RatioLabelOfIndex_0027
     * @tc.desc      ratioLabelOfIndex(index=110) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0027 begin`);
      const actual: string = ratioLabelOfIndex(110);
      logInfo(`ratioLabelOfIndex(index=110): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0028
     * @tc.name      WindowRatio_RatioLabelOfIndex_0028
     * @tc.desc      ratioLabelOfIndex(index=115) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0028 begin`);
      const actual: string = ratioLabelOfIndex(115);
      logInfo(`ratioLabelOfIndex(index=115): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0029
     * @tc.name      WindowRatio_RatioLabelOfIndex_0029
     * @tc.desc      ratioLabelOfIndex(index=120) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0029 begin`);
      const actual: string = ratioLabelOfIndex(120);
      logInfo(`ratioLabelOfIndex(index=120): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0030
     * @tc.name      WindowRatio_RatioLabelOfIndex_0030
     * @tc.desc      ratioLabelOfIndex(index=125) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0030 begin`);
      const actual: string = ratioLabelOfIndex(125);
      logInfo(`ratioLabelOfIndex(index=125): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0031
     * @tc.name      WindowRatio_RatioLabelOfIndex_0031
     * @tc.desc      ratioLabelOfIndex(index=130) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0031 begin`);
      const actual: string = ratioLabelOfIndex(130);
      logInfo(`ratioLabelOfIndex(index=130): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0032
     * @tc.name      WindowRatio_RatioLabelOfIndex_0032
     * @tc.desc      ratioLabelOfIndex(index=135) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0032 begin`);
      const actual: string = ratioLabelOfIndex(135);
      logInfo(`ratioLabelOfIndex(index=135): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0033
     * @tc.name      WindowRatio_RatioLabelOfIndex_0033
     * @tc.desc      ratioLabelOfIndex(index=140) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0033 begin`);
      const actual: string = ratioLabelOfIndex(140);
      logInfo(`ratioLabelOfIndex(index=140): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0034
     * @tc.name      WindowRatio_RatioLabelOfIndex_0034
     * @tc.desc      ratioLabelOfIndex(index=145) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0034 begin`);
      const actual: string = ratioLabelOfIndex(145);
      logInfo(`ratioLabelOfIndex(index=145): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0035
     * @tc.name      WindowRatio_RatioLabelOfIndex_0035
     * @tc.desc      ratioLabelOfIndex(index=150) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0035 begin`);
      const actual: string = ratioLabelOfIndex(150);
      logInfo(`ratioLabelOfIndex(index=150): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0036
     * @tc.name      WindowRatio_RatioLabelOfIndex_0036
     * @tc.desc      ratioLabelOfIndex(index=155) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0036 begin`);
      const actual: string = ratioLabelOfIndex(155);
      logInfo(`ratioLabelOfIndex(index=155): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0037
     * @tc.name      WindowRatio_RatioLabelOfIndex_0037
     * @tc.desc      ratioLabelOfIndex(index=160) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0037 begin`);
      const actual: string = ratioLabelOfIndex(160);
      logInfo(`ratioLabelOfIndex(index=160): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0038
     * @tc.name      WindowRatio_RatioLabelOfIndex_0038
     * @tc.desc      ratioLabelOfIndex(index=165) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0038 begin`);
      const actual: string = ratioLabelOfIndex(165);
      logInfo(`ratioLabelOfIndex(index=165): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0039
     * @tc.name      WindowRatio_RatioLabelOfIndex_0039
     * @tc.desc      ratioLabelOfIndex(index=170) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0039 begin`);
      const actual: string = ratioLabelOfIndex(170);
      logInfo(`ratioLabelOfIndex(index=170): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0040
     * @tc.name      WindowRatio_RatioLabelOfIndex_0040
     * @tc.desc      ratioLabelOfIndex(index=175) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0040 begin`);
      const actual: string = ratioLabelOfIndex(175);
      logInfo(`ratioLabelOfIndex(index=175): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0041
     * @tc.name      WindowRatio_RatioLabelOfIndex_0041
     * @tc.desc      ratioLabelOfIndex(index=180) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0041 begin`);
      const actual: string = ratioLabelOfIndex(180);
      logInfo(`ratioLabelOfIndex(index=180): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0042
     * @tc.name      WindowRatio_RatioLabelOfIndex_0042
     * @tc.desc      ratioLabelOfIndex(index=185) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0042 begin`);
      const actual: string = ratioLabelOfIndex(185);
      logInfo(`ratioLabelOfIndex(index=185): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0043
     * @tc.name      WindowRatio_RatioLabelOfIndex_0043
     * @tc.desc      ratioLabelOfIndex(index=190) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0043 begin`);
      const actual: string = ratioLabelOfIndex(190);
      logInfo(`ratioLabelOfIndex(index=190): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0044
     * @tc.name      WindowRatio_RatioLabelOfIndex_0044
     * @tc.desc      ratioLabelOfIndex(index=195) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0044 begin`);
      const actual: string = ratioLabelOfIndex(195);
      logInfo(`ratioLabelOfIndex(index=195): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0045
     * @tc.name      WindowRatio_RatioLabelOfIndex_0045
     * @tc.desc      ratioLabelOfIndex(index=200) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0045 begin`);
      const actual: string = ratioLabelOfIndex(200);
      logInfo(`ratioLabelOfIndex(index=200): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0046
     * @tc.name      WindowRatio_RatioLabelOfIndex_0046
     * @tc.desc      ratioLabelOfIndex(index=-42) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioLabelOfIndex_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0046 begin`);
      const actual: string = ratioLabelOfIndex(-42);
      logInfo(`ratioLabelOfIndex(index=-42): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0047
     * @tc.name      WindowRatio_RatioLabelOfIndex_0047
     * @tc.desc      ratioLabelOfIndex(index=96) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0047 begin`);
      const actual: string = ratioLabelOfIndex(96);
      logInfo(`ratioLabelOfIndex(index=96): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0048
     * @tc.name      WindowRatio_RatioLabelOfIndex_0048
     * @tc.desc      ratioLabelOfIndex(index=20.82) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0048 begin`);
      const actual: string = ratioLabelOfIndex(20.82);
      logInfo(`ratioLabelOfIndex(index=20.82): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0049
     * @tc.name      WindowRatio_RatioLabelOfIndex_0049
     * @tc.desc      ratioLabelOfIndex(index=124) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0049 begin`);
      const actual: string = ratioLabelOfIndex(124);
      logInfo(`ratioLabelOfIndex(index=124): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0050
     * @tc.name      WindowRatio_RatioLabelOfIndex_0050
     * @tc.desc      ratioLabelOfIndex(index=167) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0050 begin`);
      const actual: string = ratioLabelOfIndex(167);
      logInfo(`ratioLabelOfIndex(index=167): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0051
     * @tc.name      WindowRatio_RatioLabelOfIndex_0051
     * @tc.desc      ratioLabelOfIndex(index=-40) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioLabelOfIndex_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0051 begin`);
      const actual: string = ratioLabelOfIndex(-40);
      logInfo(`ratioLabelOfIndex(index=-40): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0052
     * @tc.name      WindowRatio_RatioLabelOfIndex_0052
     * @tc.desc      ratioLabelOfIndex(index=65.28) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0052 begin`);
      const actual: string = ratioLabelOfIndex(65.28);
      logInfo(`ratioLabelOfIndex(index=65.28): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0053
     * @tc.name      WindowRatio_RatioLabelOfIndex_0053
     * @tc.desc      ratioLabelOfIndex(index=8.93) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0053 begin`);
      const actual: string = ratioLabelOfIndex(8.93);
      logInfo(`ratioLabelOfIndex(index=8.93): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0054
     * @tc.name      WindowRatio_RatioLabelOfIndex_0054
     * @tc.desc      ratioLabelOfIndex(index=-19) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioLabelOfIndex_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0054 begin`);
      const actual: string = ratioLabelOfIndex(-19);
      logInfo(`ratioLabelOfIndex(index=-19): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0055
     * @tc.name      WindowRatio_RatioLabelOfIndex_0055
     * @tc.desc      ratioLabelOfIndex(index=54.29) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0055 begin`);
      const actual: string = ratioLabelOfIndex(54.29);
      logInfo(`ratioLabelOfIndex(index=54.29): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0056
     * @tc.name      WindowRatio_RatioLabelOfIndex_0056
     * @tc.desc      ratioLabelOfIndex(index=164) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0056 begin`);
      const actual: string = ratioLabelOfIndex(164);
      logInfo(`ratioLabelOfIndex(index=164): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0057
     * @tc.name      WindowRatio_RatioLabelOfIndex_0057
     * @tc.desc      ratioLabelOfIndex(index=-11) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioLabelOfIndex_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0057 begin`);
      const actual: string = ratioLabelOfIndex(-11);
      logInfo(`ratioLabelOfIndex(index=-11): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0058
     * @tc.name      WindowRatio_RatioLabelOfIndex_0058
     * @tc.desc      ratioLabelOfIndex(index=46.03) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0058 begin`);
      const actual: string = ratioLabelOfIndex(46.03);
      logInfo(`ratioLabelOfIndex(index=46.03): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0059
     * @tc.name      WindowRatio_RatioLabelOfIndex_0059
     * @tc.desc      ratioLabelOfIndex(index=144) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0059 begin`);
      const actual: string = ratioLabelOfIndex(144);
      logInfo(`ratioLabelOfIndex(index=144): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0060
     * @tc.name      WindowRatio_RatioLabelOfIndex_0060
     * @tc.desc      ratioLabelOfIndex(index=91.2) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0060 begin`);
      const actual: string = ratioLabelOfIndex(91.2);
      logInfo(`ratioLabelOfIndex(index=91.2): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0061
     * @tc.name      WindowRatio_RatioLabelOfIndex_0061
     * @tc.desc      ratioLabelOfIndex(index=183) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0061 begin`);
      const actual: string = ratioLabelOfIndex(183);
      logInfo(`ratioLabelOfIndex(index=183): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0062
     * @tc.name      WindowRatio_RatioLabelOfIndex_0062
     * @tc.desc      ratioLabelOfIndex(index=17.12) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0062 begin`);
      const actual: string = ratioLabelOfIndex(17.12);
      logInfo(`ratioLabelOfIndex(index=17.12): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0063
     * @tc.name      WindowRatio_RatioLabelOfIndex_0063
     * @tc.desc      ratioLabelOfIndex(index=76) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0063 begin`);
      const actual: string = ratioLabelOfIndex(76);
      logInfo(`ratioLabelOfIndex(index=76): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0064
     * @tc.name      WindowRatio_RatioLabelOfIndex_0064
     * @tc.desc      ratioLabelOfIndex(index=-25) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioLabelOfIndex_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0064 begin`);
      const actual: string = ratioLabelOfIndex(-25);
      logInfo(`ratioLabelOfIndex(index=-25): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0065
     * @tc.name      WindowRatio_RatioLabelOfIndex_0065
     * @tc.desc      ratioLabelOfIndex(index=-6) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioLabelOfIndex_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0065 begin`);
      const actual: string = ratioLabelOfIndex(-6);
      logInfo(`ratioLabelOfIndex(index=-6): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0066
     * @tc.name      WindowRatio_RatioLabelOfIndex_0066
     * @tc.desc      ratioLabelOfIndex(index=143) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0066 begin`);
      const actual: string = ratioLabelOfIndex(143);
      logInfo(`ratioLabelOfIndex(index=143): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0067
     * @tc.name      WindowRatio_RatioLabelOfIndex_0067
     * @tc.desc      ratioLabelOfIndex(index=121) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0067 begin`);
      const actual: string = ratioLabelOfIndex(121);
      logInfo(`ratioLabelOfIndex(index=121): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0068
     * @tc.name      WindowRatio_RatioLabelOfIndex_0068
     * @tc.desc      ratioLabelOfIndex(index=-59) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioLabelOfIndex_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0068 begin`);
      const actual: string = ratioLabelOfIndex(-59);
      logInfo(`ratioLabelOfIndex(index=-59): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0069
     * @tc.name      WindowRatio_RatioLabelOfIndex_0069
     * @tc.desc      ratioLabelOfIndex(index=73.58) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0069 begin`);
      const actual: string = ratioLabelOfIndex(73.58);
      logInfo(`ratioLabelOfIndex(index=73.58): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0070
     * @tc.name      WindowRatio_RatioLabelOfIndex_0070
     * @tc.desc      ratioLabelOfIndex(index=44.21) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0070 begin`);
      const actual: string = ratioLabelOfIndex(44.21);
      logInfo(`ratioLabelOfIndex(index=44.21): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0071
     * @tc.name      WindowRatio_RatioLabelOfIndex_0071
     * @tc.desc      ratioLabelOfIndex(index=106) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0071 begin`);
      const actual: string = ratioLabelOfIndex(106);
      logInfo(`ratioLabelOfIndex(index=106): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0072
     * @tc.name      WindowRatio_RatioLabelOfIndex_0072
     * @tc.desc      ratioLabelOfIndex(index=89) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0072 begin`);
      const actual: string = ratioLabelOfIndex(89);
      logInfo(`ratioLabelOfIndex(index=89): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0073
     * @tc.name      WindowRatio_RatioLabelOfIndex_0073
     * @tc.desc      ratioLabelOfIndex(index=35.38) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0073 begin`);
      const actual: string = ratioLabelOfIndex(35.38);
      logInfo(`ratioLabelOfIndex(index=35.38): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0074
     * @tc.name      WindowRatio_RatioLabelOfIndex_0074
     * @tc.desc      ratioLabelOfIndex(index=51) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0074 begin`);
      const actual: string = ratioLabelOfIndex(51);
      logInfo(`ratioLabelOfIndex(index=51): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_LABEL_OF_INDEX_0075
     * @tc.name      WindowRatio_RatioLabelOfIndex_0075
     * @tc.desc      ratioLabelOfIndex(index=99.05) returns "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioLabelOfIndex_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioLabelOfIndex_0075 begin`);
      const actual: string = ratioLabelOfIndex(99.05);
      logInfo(`ratioLabelOfIndex(index=99.05): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioLabelOfIndex_0075 end`);
    });
  });
}
