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
import { sizeSummaryOf } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sizeSummaryOf (96 cases). */
export default function sizeSummaryOfTest(): void {
  describe('SizeSummaryOfTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0001
     * @tc.name      WindowRatio_SizeSummaryOf_0001
     * @tc.desc      sizeSummaryOf(width=0, height=0) returns "0 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_SizeSummaryOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0001 begin`);
      const actual: string = sizeSummaryOf(0, 0);
      logInfo(`sizeSummaryOf(width=0, height=0): actual=${actual}`);
      expect(actual).assertEqual('0 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0002
     * @tc.name      WindowRatio_SizeSummaryOf_0002
     * @tc.desc      sizeSummaryOf(width=0, height=1) returns "0 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_SizeSummaryOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0002 begin`);
      const actual: string = sizeSummaryOf(0, 1);
      logInfo(`sizeSummaryOf(width=0, height=1): actual=${actual}`);
      expect(actual).assertEqual('0 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0003
     * @tc.name      WindowRatio_SizeSummaryOf_0003
     * @tc.desc      sizeSummaryOf(width=0, height=100) returns "0 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0003 begin`);
      const actual: string = sizeSummaryOf(0, 100);
      logInfo(`sizeSummaryOf(width=0, height=100): actual=${actual}`);
      expect(actual).assertEqual('0 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0004
     * @tc.name      WindowRatio_SizeSummaryOf_0004
     * @tc.desc      sizeSummaryOf(width=0, height=360) returns "0 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0004 begin`);
      const actual: string = sizeSummaryOf(0, 360);
      logInfo(`sizeSummaryOf(width=0, height=360): actual=${actual}`);
      expect(actual).assertEqual('0 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0005
     * @tc.name      WindowRatio_SizeSummaryOf_0005
     * @tc.desc      sizeSummaryOf(width=0, height=720) returns "0 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0005 begin`);
      const actual: string = sizeSummaryOf(0, 720);
      logInfo(`sizeSummaryOf(width=0, height=720): actual=${actual}`);
      expect(actual).assertEqual('0 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0006
     * @tc.name      WindowRatio_SizeSummaryOf_0006
     * @tc.desc      sizeSummaryOf(width=0, height=1080) returns "0 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0006 begin`);
      const actual: string = sizeSummaryOf(0, 1080);
      logInfo(`sizeSummaryOf(width=0, height=1080): actual=${actual}`);
      expect(actual).assertEqual('0 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0007
     * @tc.name      WindowRatio_SizeSummaryOf_0007
     * @tc.desc      sizeSummaryOf(width=0, height=1920) returns "0 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0007 begin`);
      const actual: string = sizeSummaryOf(0, 1920);
      logInfo(`sizeSummaryOf(width=0, height=1920): actual=${actual}`);
      expect(actual).assertEqual('0 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0008
     * @tc.name      WindowRatio_SizeSummaryOf_0008
     * @tc.desc      sizeSummaryOf(width=0, height=-1) returns "0 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0008 begin`);
      const actual: string = sizeSummaryOf(0, -1);
      logInfo(`sizeSummaryOf(width=0, height=-1): actual=${actual}`);
      expect(actual).assertEqual('0 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0009
     * @tc.name      WindowRatio_SizeSummaryOf_0009
     * @tc.desc      sizeSummaryOf(width=0, height=2) returns "0 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0009 begin`);
      const actual: string = sizeSummaryOf(0, 2);
      logInfo(`sizeSummaryOf(width=0, height=2): actual=${actual}`);
      expect(actual).assertEqual('0 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0010
     * @tc.name      WindowRatio_SizeSummaryOf_0010
     * @tc.desc      sizeSummaryOf(width=0, height=3) returns "0 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0010 begin`);
      const actual: string = sizeSummaryOf(0, 3);
      logInfo(`sizeSummaryOf(width=0, height=3): actual=${actual}`);
      expect(actual).assertEqual('0 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0011
     * @tc.name      WindowRatio_SizeSummaryOf_0011
     * @tc.desc      sizeSummaryOf(width=0, height=10) returns "0 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0011 begin`);
      const actual: string = sizeSummaryOf(0, 10);
      logInfo(`sizeSummaryOf(width=0, height=10): actual=${actual}`);
      expect(actual).assertEqual('0 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0012
     * @tc.name      WindowRatio_SizeSummaryOf_0012
     * @tc.desc      sizeSummaryOf(width=0, height=96) returns "0 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0012 begin`);
      const actual: string = sizeSummaryOf(0, 96);
      logInfo(`sizeSummaryOf(width=0, height=96): actual=${actual}`);
      expect(actual).assertEqual('0 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0013
     * @tc.name      WindowRatio_SizeSummaryOf_0013
     * @tc.desc      sizeSummaryOf(width=0, height=192) returns "0 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0013 begin`);
      const actual: string = sizeSummaryOf(0, 192);
      logInfo(`sizeSummaryOf(width=0, height=192): actual=${actual}`);
      expect(actual).assertEqual('0 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0014
     * @tc.name      WindowRatio_SizeSummaryOf_0014
     * @tc.desc      sizeSummaryOf(width=0, height=288) returns "0 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0014 begin`);
      const actual: string = sizeSummaryOf(0, 288);
      logInfo(`sizeSummaryOf(width=0, height=288): actual=${actual}`);
      expect(actual).assertEqual('0 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0015
     * @tc.name      WindowRatio_SizeSummaryOf_0015
     * @tc.desc      sizeSummaryOf(width=0, height=384) returns "0 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0015 begin`);
      const actual: string = sizeSummaryOf(0, 384);
      logInfo(`sizeSummaryOf(width=0, height=384): actual=${actual}`);
      expect(actual).assertEqual('0 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0016
     * @tc.name      WindowRatio_SizeSummaryOf_0016
     * @tc.desc      sizeSummaryOf(width=0, height=480) returns "0 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0016 begin`);
      const actual: string = sizeSummaryOf(0, 480);
      logInfo(`sizeSummaryOf(width=0, height=480): actual=${actual}`);
      expect(actual).assertEqual('0 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0017
     * @tc.name      WindowRatio_SizeSummaryOf_0017
     * @tc.desc      sizeSummaryOf(width=0, height=576) returns "0 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0017 begin`);
      const actual: string = sizeSummaryOf(0, 576);
      logInfo(`sizeSummaryOf(width=0, height=576): actual=${actual}`);
      expect(actual).assertEqual('0 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0018
     * @tc.name      WindowRatio_SizeSummaryOf_0018
     * @tc.desc      sizeSummaryOf(width=0, height=672) returns "0 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0018 begin`);
      const actual: string = sizeSummaryOf(0, 672);
      logInfo(`sizeSummaryOf(width=0, height=672): actual=${actual}`);
      expect(actual).assertEqual('0 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0019
     * @tc.name      WindowRatio_SizeSummaryOf_0019
     * @tc.desc      sizeSummaryOf(width=0, height=768) returns "0 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0019 begin`);
      const actual: string = sizeSummaryOf(0, 768);
      logInfo(`sizeSummaryOf(width=0, height=768): actual=${actual}`);
      expect(actual).assertEqual('0 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0020
     * @tc.name      WindowRatio_SizeSummaryOf_0020
     * @tc.desc      sizeSummaryOf(width=0, height=864) returns "0 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0020 begin`);
      const actual: string = sizeSummaryOf(0, 864);
      logInfo(`sizeSummaryOf(width=0, height=864): actual=${actual}`);
      expect(actual).assertEqual('0 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0021
     * @tc.name      WindowRatio_SizeSummaryOf_0021
     * @tc.desc      sizeSummaryOf(width=0, height=960) returns "0 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0021 begin`);
      const actual: string = sizeSummaryOf(0, 960);
      logInfo(`sizeSummaryOf(width=0, height=960): actual=${actual}`);
      expect(actual).assertEqual('0 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0022
     * @tc.name      WindowRatio_SizeSummaryOf_0022
     * @tc.desc      sizeSummaryOf(width=0, height=1056) returns "0 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0022 begin`);
      const actual: string = sizeSummaryOf(0, 1056);
      logInfo(`sizeSummaryOf(width=0, height=1056): actual=${actual}`);
      expect(actual).assertEqual('0 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0023
     * @tc.name      WindowRatio_SizeSummaryOf_0023
     * @tc.desc      sizeSummaryOf(width=0, height=1152) returns "0 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0023 begin`);
      const actual: string = sizeSummaryOf(0, 1152);
      logInfo(`sizeSummaryOf(width=0, height=1152): actual=${actual}`);
      expect(actual).assertEqual('0 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0024
     * @tc.name      WindowRatio_SizeSummaryOf_0024
     * @tc.desc      sizeSummaryOf(width=0, height=1248) returns "0 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0024 begin`);
      const actual: string = sizeSummaryOf(0, 1248);
      logInfo(`sizeSummaryOf(width=0, height=1248): actual=${actual}`);
      expect(actual).assertEqual('0 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0025
     * @tc.name      WindowRatio_SizeSummaryOf_0025
     * @tc.desc      sizeSummaryOf(width=0, height=1344) returns "0 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0025 begin`);
      const actual: string = sizeSummaryOf(0, 1344);
      logInfo(`sizeSummaryOf(width=0, height=1344): actual=${actual}`);
      expect(actual).assertEqual('0 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0026
     * @tc.name      WindowRatio_SizeSummaryOf_0026
     * @tc.desc      sizeSummaryOf(width=0, height=1440) returns "0 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0026 begin`);
      const actual: string = sizeSummaryOf(0, 1440);
      logInfo(`sizeSummaryOf(width=0, height=1440): actual=${actual}`);
      expect(actual).assertEqual('0 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0027
     * @tc.name      WindowRatio_SizeSummaryOf_0027
     * @tc.desc      sizeSummaryOf(width=0, height=1536) returns "0 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0027 begin`);
      const actual: string = sizeSummaryOf(0, 1536);
      logInfo(`sizeSummaryOf(width=0, height=1536): actual=${actual}`);
      expect(actual).assertEqual('0 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0028
     * @tc.name      WindowRatio_SizeSummaryOf_0028
     * @tc.desc      sizeSummaryOf(width=0, height=1632) returns "0 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0028 begin`);
      const actual: string = sizeSummaryOf(0, 1632);
      logInfo(`sizeSummaryOf(width=0, height=1632): actual=${actual}`);
      expect(actual).assertEqual('0 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0029
     * @tc.name      WindowRatio_SizeSummaryOf_0029
     * @tc.desc      sizeSummaryOf(width=0, height=1728) returns "0 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0029 begin`);
      const actual: string = sizeSummaryOf(0, 1728);
      logInfo(`sizeSummaryOf(width=0, height=1728): actual=${actual}`);
      expect(actual).assertEqual('0 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0030
     * @tc.name      WindowRatio_SizeSummaryOf_0030
     * @tc.desc      sizeSummaryOf(width=0, height=1824) returns "0 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0030 begin`);
      const actual: string = sizeSummaryOf(0, 1824);
      logInfo(`sizeSummaryOf(width=0, height=1824): actual=${actual}`);
      expect(actual).assertEqual('0 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0031
     * @tc.name      WindowRatio_SizeSummaryOf_0031
     * @tc.desc      sizeSummaryOf(width=1, height=0) returns "1 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0031 begin`);
      const actual: string = sizeSummaryOf(1, 0);
      logInfo(`sizeSummaryOf(width=1, height=0): actual=${actual}`);
      expect(actual).assertEqual('1 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0032
     * @tc.name      WindowRatio_SizeSummaryOf_0032
     * @tc.desc      sizeSummaryOf(width=1, height=1) returns "1 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0032 begin`);
      const actual: string = sizeSummaryOf(1, 1);
      logInfo(`sizeSummaryOf(width=1, height=1): actual=${actual}`);
      expect(actual).assertEqual('1 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0033
     * @tc.name      WindowRatio_SizeSummaryOf_0033
     * @tc.desc      sizeSummaryOf(width=1, height=100) returns "1 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0033 begin`);
      const actual: string = sizeSummaryOf(1, 100);
      logInfo(`sizeSummaryOf(width=1, height=100): actual=${actual}`);
      expect(actual).assertEqual('1 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0034
     * @tc.name      WindowRatio_SizeSummaryOf_0034
     * @tc.desc      sizeSummaryOf(width=1, height=360) returns "1 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0034 begin`);
      const actual: string = sizeSummaryOf(1, 360);
      logInfo(`sizeSummaryOf(width=1, height=360): actual=${actual}`);
      expect(actual).assertEqual('1 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0035
     * @tc.name      WindowRatio_SizeSummaryOf_0035
     * @tc.desc      sizeSummaryOf(width=1, height=720) returns "1 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0035 begin`);
      const actual: string = sizeSummaryOf(1, 720);
      logInfo(`sizeSummaryOf(width=1, height=720): actual=${actual}`);
      expect(actual).assertEqual('1 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0036
     * @tc.name      WindowRatio_SizeSummaryOf_0036
     * @tc.desc      sizeSummaryOf(width=1, height=1080) returns "1 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0036 begin`);
      const actual: string = sizeSummaryOf(1, 1080);
      logInfo(`sizeSummaryOf(width=1, height=1080): actual=${actual}`);
      expect(actual).assertEqual('1 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0037
     * @tc.name      WindowRatio_SizeSummaryOf_0037
     * @tc.desc      sizeSummaryOf(width=1, height=1920) returns "1 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0037 begin`);
      const actual: string = sizeSummaryOf(1, 1920);
      logInfo(`sizeSummaryOf(width=1, height=1920): actual=${actual}`);
      expect(actual).assertEqual('1 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0038
     * @tc.name      WindowRatio_SizeSummaryOf_0038
     * @tc.desc      sizeSummaryOf(width=1, height=-1) returns "1 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0038 begin`);
      const actual: string = sizeSummaryOf(1, -1);
      logInfo(`sizeSummaryOf(width=1, height=-1): actual=${actual}`);
      expect(actual).assertEqual('1 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0039
     * @tc.name      WindowRatio_SizeSummaryOf_0039
     * @tc.desc      sizeSummaryOf(width=1, height=2) returns "1 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0039 begin`);
      const actual: string = sizeSummaryOf(1, 2);
      logInfo(`sizeSummaryOf(width=1, height=2): actual=${actual}`);
      expect(actual).assertEqual('1 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0040
     * @tc.name      WindowRatio_SizeSummaryOf_0040
     * @tc.desc      sizeSummaryOf(width=1, height=3) returns "1 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0040 begin`);
      const actual: string = sizeSummaryOf(1, 3);
      logInfo(`sizeSummaryOf(width=1, height=3): actual=${actual}`);
      expect(actual).assertEqual('1 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0041
     * @tc.name      WindowRatio_SizeSummaryOf_0041
     * @tc.desc      sizeSummaryOf(width=1, height=10) returns "1 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0041 begin`);
      const actual: string = sizeSummaryOf(1, 10);
      logInfo(`sizeSummaryOf(width=1, height=10): actual=${actual}`);
      expect(actual).assertEqual('1 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0042
     * @tc.name      WindowRatio_SizeSummaryOf_0042
     * @tc.desc      sizeSummaryOf(width=1, height=96) returns "1 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0042 begin`);
      const actual: string = sizeSummaryOf(1, 96);
      logInfo(`sizeSummaryOf(width=1, height=96): actual=${actual}`);
      expect(actual).assertEqual('1 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0043
     * @tc.name      WindowRatio_SizeSummaryOf_0043
     * @tc.desc      sizeSummaryOf(width=1, height=192) returns "1 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0043 begin`);
      const actual: string = sizeSummaryOf(1, 192);
      logInfo(`sizeSummaryOf(width=1, height=192): actual=${actual}`);
      expect(actual).assertEqual('1 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0044
     * @tc.name      WindowRatio_SizeSummaryOf_0044
     * @tc.desc      sizeSummaryOf(width=1, height=288) returns "1 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0044 begin`);
      const actual: string = sizeSummaryOf(1, 288);
      logInfo(`sizeSummaryOf(width=1, height=288): actual=${actual}`);
      expect(actual).assertEqual('1 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0045
     * @tc.name      WindowRatio_SizeSummaryOf_0045
     * @tc.desc      sizeSummaryOf(width=1, height=384) returns "1 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0045 begin`);
      const actual: string = sizeSummaryOf(1, 384);
      logInfo(`sizeSummaryOf(width=1, height=384): actual=${actual}`);
      expect(actual).assertEqual('1 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0046
     * @tc.name      WindowRatio_SizeSummaryOf_0046
     * @tc.desc      sizeSummaryOf(width=1, height=480) returns "1 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0046 begin`);
      const actual: string = sizeSummaryOf(1, 480);
      logInfo(`sizeSummaryOf(width=1, height=480): actual=${actual}`);
      expect(actual).assertEqual('1 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0047
     * @tc.name      WindowRatio_SizeSummaryOf_0047
     * @tc.desc      sizeSummaryOf(width=1, height=576) returns "1 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0047 begin`);
      const actual: string = sizeSummaryOf(1, 576);
      logInfo(`sizeSummaryOf(width=1, height=576): actual=${actual}`);
      expect(actual).assertEqual('1 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0048
     * @tc.name      WindowRatio_SizeSummaryOf_0048
     * @tc.desc      sizeSummaryOf(width=1, height=672) returns "1 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0048 begin`);
      const actual: string = sizeSummaryOf(1, 672);
      logInfo(`sizeSummaryOf(width=1, height=672): actual=${actual}`);
      expect(actual).assertEqual('1 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0049
     * @tc.name      WindowRatio_SizeSummaryOf_0049
     * @tc.desc      sizeSummaryOf(width=1, height=768) returns "1 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0049 begin`);
      const actual: string = sizeSummaryOf(1, 768);
      logInfo(`sizeSummaryOf(width=1, height=768): actual=${actual}`);
      expect(actual).assertEqual('1 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0050
     * @tc.name      WindowRatio_SizeSummaryOf_0050
     * @tc.desc      sizeSummaryOf(width=1, height=864) returns "1 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0050 begin`);
      const actual: string = sizeSummaryOf(1, 864);
      logInfo(`sizeSummaryOf(width=1, height=864): actual=${actual}`);
      expect(actual).assertEqual('1 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0051
     * @tc.name      WindowRatio_SizeSummaryOf_0051
     * @tc.desc      sizeSummaryOf(width=1, height=960) returns "1 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0051 begin`);
      const actual: string = sizeSummaryOf(1, 960);
      logInfo(`sizeSummaryOf(width=1, height=960): actual=${actual}`);
      expect(actual).assertEqual('1 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0052
     * @tc.name      WindowRatio_SizeSummaryOf_0052
     * @tc.desc      sizeSummaryOf(width=1, height=1056) returns "1 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0052 begin`);
      const actual: string = sizeSummaryOf(1, 1056);
      logInfo(`sizeSummaryOf(width=1, height=1056): actual=${actual}`);
      expect(actual).assertEqual('1 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0053
     * @tc.name      WindowRatio_SizeSummaryOf_0053
     * @tc.desc      sizeSummaryOf(width=1, height=1152) returns "1 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0053 begin`);
      const actual: string = sizeSummaryOf(1, 1152);
      logInfo(`sizeSummaryOf(width=1, height=1152): actual=${actual}`);
      expect(actual).assertEqual('1 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0054
     * @tc.name      WindowRatio_SizeSummaryOf_0054
     * @tc.desc      sizeSummaryOf(width=1, height=1248) returns "1 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0054 begin`);
      const actual: string = sizeSummaryOf(1, 1248);
      logInfo(`sizeSummaryOf(width=1, height=1248): actual=${actual}`);
      expect(actual).assertEqual('1 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0055
     * @tc.name      WindowRatio_SizeSummaryOf_0055
     * @tc.desc      sizeSummaryOf(width=1, height=1344) returns "1 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0055 begin`);
      const actual: string = sizeSummaryOf(1, 1344);
      logInfo(`sizeSummaryOf(width=1, height=1344): actual=${actual}`);
      expect(actual).assertEqual('1 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0056
     * @tc.name      WindowRatio_SizeSummaryOf_0056
     * @tc.desc      sizeSummaryOf(width=1, height=1440) returns "1 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0056 begin`);
      const actual: string = sizeSummaryOf(1, 1440);
      logInfo(`sizeSummaryOf(width=1, height=1440): actual=${actual}`);
      expect(actual).assertEqual('1 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0057
     * @tc.name      WindowRatio_SizeSummaryOf_0057
     * @tc.desc      sizeSummaryOf(width=1, height=1536) returns "1 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0057 begin`);
      const actual: string = sizeSummaryOf(1, 1536);
      logInfo(`sizeSummaryOf(width=1, height=1536): actual=${actual}`);
      expect(actual).assertEqual('1 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0058
     * @tc.name      WindowRatio_SizeSummaryOf_0058
     * @tc.desc      sizeSummaryOf(width=1, height=1632) returns "1 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0058 begin`);
      const actual: string = sizeSummaryOf(1, 1632);
      logInfo(`sizeSummaryOf(width=1, height=1632): actual=${actual}`);
      expect(actual).assertEqual('1 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0059
     * @tc.name      WindowRatio_SizeSummaryOf_0059
     * @tc.desc      sizeSummaryOf(width=1, height=1728) returns "1 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0059 begin`);
      const actual: string = sizeSummaryOf(1, 1728);
      logInfo(`sizeSummaryOf(width=1, height=1728): actual=${actual}`);
      expect(actual).assertEqual('1 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0060
     * @tc.name      WindowRatio_SizeSummaryOf_0060
     * @tc.desc      sizeSummaryOf(width=1, height=1824) returns "1 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0060 begin`);
      const actual: string = sizeSummaryOf(1, 1824);
      logInfo(`sizeSummaryOf(width=1, height=1824): actual=${actual}`);
      expect(actual).assertEqual('1 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0061
     * @tc.name      WindowRatio_SizeSummaryOf_0061
     * @tc.desc      sizeSummaryOf(width=100, height=0) returns "100 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0061 begin`);
      const actual: string = sizeSummaryOf(100, 0);
      logInfo(`sizeSummaryOf(width=100, height=0): actual=${actual}`);
      expect(actual).assertEqual('100 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0062
     * @tc.name      WindowRatio_SizeSummaryOf_0062
     * @tc.desc      sizeSummaryOf(width=100, height=1) returns "100 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0062 begin`);
      const actual: string = sizeSummaryOf(100, 1);
      logInfo(`sizeSummaryOf(width=100, height=1): actual=${actual}`);
      expect(actual).assertEqual('100 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0063
     * @tc.name      WindowRatio_SizeSummaryOf_0063
     * @tc.desc      sizeSummaryOf(width=100, height=100) returns "100 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0063 begin`);
      const actual: string = sizeSummaryOf(100, 100);
      logInfo(`sizeSummaryOf(width=100, height=100): actual=${actual}`);
      expect(actual).assertEqual('100 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0064
     * @tc.name      WindowRatio_SizeSummaryOf_0064
     * @tc.desc      sizeSummaryOf(width=100, height=360) returns "100 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0064 begin`);
      const actual: string = sizeSummaryOf(100, 360);
      logInfo(`sizeSummaryOf(width=100, height=360): actual=${actual}`);
      expect(actual).assertEqual('100 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0065
     * @tc.name      WindowRatio_SizeSummaryOf_0065
     * @tc.desc      sizeSummaryOf(width=100, height=720) returns "100 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0065 begin`);
      const actual: string = sizeSummaryOf(100, 720);
      logInfo(`sizeSummaryOf(width=100, height=720): actual=${actual}`);
      expect(actual).assertEqual('100 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0066
     * @tc.name      WindowRatio_SizeSummaryOf_0066
     * @tc.desc      sizeSummaryOf(width=100, height=1080) returns "100 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0066 begin`);
      const actual: string = sizeSummaryOf(100, 1080);
      logInfo(`sizeSummaryOf(width=100, height=1080): actual=${actual}`);
      expect(actual).assertEqual('100 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0067
     * @tc.name      WindowRatio_SizeSummaryOf_0067
     * @tc.desc      sizeSummaryOf(width=100, height=1920) returns "100 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0067 begin`);
      const actual: string = sizeSummaryOf(100, 1920);
      logInfo(`sizeSummaryOf(width=100, height=1920): actual=${actual}`);
      expect(actual).assertEqual('100 x 1920');
      logInfo(`${BUNDLE}SizeSummaryOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0068
     * @tc.name      WindowRatio_SizeSummaryOf_0068
     * @tc.desc      sizeSummaryOf(width=100, height=-1) returns "100 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeSummaryOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0068 begin`);
      const actual: string = sizeSummaryOf(100, -1);
      logInfo(`sizeSummaryOf(width=100, height=-1): actual=${actual}`);
      expect(actual).assertEqual('100 x -1');
      logInfo(`${BUNDLE}SizeSummaryOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0069
     * @tc.name      WindowRatio_SizeSummaryOf_0069
     * @tc.desc      sizeSummaryOf(width=100, height=2) returns "100 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0069 begin`);
      const actual: string = sizeSummaryOf(100, 2);
      logInfo(`sizeSummaryOf(width=100, height=2): actual=${actual}`);
      expect(actual).assertEqual('100 x 2');
      logInfo(`${BUNDLE}SizeSummaryOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0070
     * @tc.name      WindowRatio_SizeSummaryOf_0070
     * @tc.desc      sizeSummaryOf(width=100, height=3) returns "100 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0070 begin`);
      const actual: string = sizeSummaryOf(100, 3);
      logInfo(`sizeSummaryOf(width=100, height=3): actual=${actual}`);
      expect(actual).assertEqual('100 x 3');
      logInfo(`${BUNDLE}SizeSummaryOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0071
     * @tc.name      WindowRatio_SizeSummaryOf_0071
     * @tc.desc      sizeSummaryOf(width=100, height=10) returns "100 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0071 begin`);
      const actual: string = sizeSummaryOf(100, 10);
      logInfo(`sizeSummaryOf(width=100, height=10): actual=${actual}`);
      expect(actual).assertEqual('100 x 10');
      logInfo(`${BUNDLE}SizeSummaryOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0072
     * @tc.name      WindowRatio_SizeSummaryOf_0072
     * @tc.desc      sizeSummaryOf(width=100, height=96) returns "100 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0072 begin`);
      const actual: string = sizeSummaryOf(100, 96);
      logInfo(`sizeSummaryOf(width=100, height=96): actual=${actual}`);
      expect(actual).assertEqual('100 x 96');
      logInfo(`${BUNDLE}SizeSummaryOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0073
     * @tc.name      WindowRatio_SizeSummaryOf_0073
     * @tc.desc      sizeSummaryOf(width=100, height=192) returns "100 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0073 begin`);
      const actual: string = sizeSummaryOf(100, 192);
      logInfo(`sizeSummaryOf(width=100, height=192): actual=${actual}`);
      expect(actual).assertEqual('100 x 192');
      logInfo(`${BUNDLE}SizeSummaryOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0074
     * @tc.name      WindowRatio_SizeSummaryOf_0074
     * @tc.desc      sizeSummaryOf(width=100, height=288) returns "100 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0074 begin`);
      const actual: string = sizeSummaryOf(100, 288);
      logInfo(`sizeSummaryOf(width=100, height=288): actual=${actual}`);
      expect(actual).assertEqual('100 x 288');
      logInfo(`${BUNDLE}SizeSummaryOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0075
     * @tc.name      WindowRatio_SizeSummaryOf_0075
     * @tc.desc      sizeSummaryOf(width=100, height=384) returns "100 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0075 begin`);
      const actual: string = sizeSummaryOf(100, 384);
      logInfo(`sizeSummaryOf(width=100, height=384): actual=${actual}`);
      expect(actual).assertEqual('100 x 384');
      logInfo(`${BUNDLE}SizeSummaryOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0076
     * @tc.name      WindowRatio_SizeSummaryOf_0076
     * @tc.desc      sizeSummaryOf(width=100, height=480) returns "100 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0076 begin`);
      const actual: string = sizeSummaryOf(100, 480);
      logInfo(`sizeSummaryOf(width=100, height=480): actual=${actual}`);
      expect(actual).assertEqual('100 x 480');
      logInfo(`${BUNDLE}SizeSummaryOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0077
     * @tc.name      WindowRatio_SizeSummaryOf_0077
     * @tc.desc      sizeSummaryOf(width=100, height=576) returns "100 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0077 begin`);
      const actual: string = sizeSummaryOf(100, 576);
      logInfo(`sizeSummaryOf(width=100, height=576): actual=${actual}`);
      expect(actual).assertEqual('100 x 576');
      logInfo(`${BUNDLE}SizeSummaryOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0078
     * @tc.name      WindowRatio_SizeSummaryOf_0078
     * @tc.desc      sizeSummaryOf(width=100, height=672) returns "100 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0078 begin`);
      const actual: string = sizeSummaryOf(100, 672);
      logInfo(`sizeSummaryOf(width=100, height=672): actual=${actual}`);
      expect(actual).assertEqual('100 x 672');
      logInfo(`${BUNDLE}SizeSummaryOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0079
     * @tc.name      WindowRatio_SizeSummaryOf_0079
     * @tc.desc      sizeSummaryOf(width=100, height=768) returns "100 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0079 begin`);
      const actual: string = sizeSummaryOf(100, 768);
      logInfo(`sizeSummaryOf(width=100, height=768): actual=${actual}`);
      expect(actual).assertEqual('100 x 768');
      logInfo(`${BUNDLE}SizeSummaryOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0080
     * @tc.name      WindowRatio_SizeSummaryOf_0080
     * @tc.desc      sizeSummaryOf(width=100, height=864) returns "100 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0080 begin`);
      const actual: string = sizeSummaryOf(100, 864);
      logInfo(`sizeSummaryOf(width=100, height=864): actual=${actual}`);
      expect(actual).assertEqual('100 x 864');
      logInfo(`${BUNDLE}SizeSummaryOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0081
     * @tc.name      WindowRatio_SizeSummaryOf_0081
     * @tc.desc      sizeSummaryOf(width=100, height=960) returns "100 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0081 begin`);
      const actual: string = sizeSummaryOf(100, 960);
      logInfo(`sizeSummaryOf(width=100, height=960): actual=${actual}`);
      expect(actual).assertEqual('100 x 960');
      logInfo(`${BUNDLE}SizeSummaryOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0082
     * @tc.name      WindowRatio_SizeSummaryOf_0082
     * @tc.desc      sizeSummaryOf(width=100, height=1056) returns "100 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0082 begin`);
      const actual: string = sizeSummaryOf(100, 1056);
      logInfo(`sizeSummaryOf(width=100, height=1056): actual=${actual}`);
      expect(actual).assertEqual('100 x 1056');
      logInfo(`${BUNDLE}SizeSummaryOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0083
     * @tc.name      WindowRatio_SizeSummaryOf_0083
     * @tc.desc      sizeSummaryOf(width=100, height=1152) returns "100 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0083 begin`);
      const actual: string = sizeSummaryOf(100, 1152);
      logInfo(`sizeSummaryOf(width=100, height=1152): actual=${actual}`);
      expect(actual).assertEqual('100 x 1152');
      logInfo(`${BUNDLE}SizeSummaryOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0084
     * @tc.name      WindowRatio_SizeSummaryOf_0084
     * @tc.desc      sizeSummaryOf(width=100, height=1248) returns "100 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0084 begin`);
      const actual: string = sizeSummaryOf(100, 1248);
      logInfo(`sizeSummaryOf(width=100, height=1248): actual=${actual}`);
      expect(actual).assertEqual('100 x 1248');
      logInfo(`${BUNDLE}SizeSummaryOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0085
     * @tc.name      WindowRatio_SizeSummaryOf_0085
     * @tc.desc      sizeSummaryOf(width=100, height=1344) returns "100 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0085 begin`);
      const actual: string = sizeSummaryOf(100, 1344);
      logInfo(`sizeSummaryOf(width=100, height=1344): actual=${actual}`);
      expect(actual).assertEqual('100 x 1344');
      logInfo(`${BUNDLE}SizeSummaryOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0086
     * @tc.name      WindowRatio_SizeSummaryOf_0086
     * @tc.desc      sizeSummaryOf(width=100, height=1440) returns "100 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0086 begin`);
      const actual: string = sizeSummaryOf(100, 1440);
      logInfo(`sizeSummaryOf(width=100, height=1440): actual=${actual}`);
      expect(actual).assertEqual('100 x 1440');
      logInfo(`${BUNDLE}SizeSummaryOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0087
     * @tc.name      WindowRatio_SizeSummaryOf_0087
     * @tc.desc      sizeSummaryOf(width=100, height=1536) returns "100 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0087 begin`);
      const actual: string = sizeSummaryOf(100, 1536);
      logInfo(`sizeSummaryOf(width=100, height=1536): actual=${actual}`);
      expect(actual).assertEqual('100 x 1536');
      logInfo(`${BUNDLE}SizeSummaryOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0088
     * @tc.name      WindowRatio_SizeSummaryOf_0088
     * @tc.desc      sizeSummaryOf(width=100, height=1632) returns "100 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0088 begin`);
      const actual: string = sizeSummaryOf(100, 1632);
      logInfo(`sizeSummaryOf(width=100, height=1632): actual=${actual}`);
      expect(actual).assertEqual('100 x 1632');
      logInfo(`${BUNDLE}SizeSummaryOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0089
     * @tc.name      WindowRatio_SizeSummaryOf_0089
     * @tc.desc      sizeSummaryOf(width=100, height=1728) returns "100 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0089 begin`);
      const actual: string = sizeSummaryOf(100, 1728);
      logInfo(`sizeSummaryOf(width=100, height=1728): actual=${actual}`);
      expect(actual).assertEqual('100 x 1728');
      logInfo(`${BUNDLE}SizeSummaryOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0090
     * @tc.name      WindowRatio_SizeSummaryOf_0090
     * @tc.desc      sizeSummaryOf(width=100, height=1824) returns "100 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0090 begin`);
      const actual: string = sizeSummaryOf(100, 1824);
      logInfo(`sizeSummaryOf(width=100, height=1824): actual=${actual}`);
      expect(actual).assertEqual('100 x 1824');
      logInfo(`${BUNDLE}SizeSummaryOf_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0091
     * @tc.name      WindowRatio_SizeSummaryOf_0091
     * @tc.desc      sizeSummaryOf(width=360, height=0) returns "360 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0091 begin`);
      const actual: string = sizeSummaryOf(360, 0);
      logInfo(`sizeSummaryOf(width=360, height=0): actual=${actual}`);
      expect(actual).assertEqual('360 x 0');
      logInfo(`${BUNDLE}SizeSummaryOf_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0092
     * @tc.name      WindowRatio_SizeSummaryOf_0092
     * @tc.desc      sizeSummaryOf(width=360, height=1) returns "360 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0092 begin`);
      const actual: string = sizeSummaryOf(360, 1);
      logInfo(`sizeSummaryOf(width=360, height=1): actual=${actual}`);
      expect(actual).assertEqual('360 x 1');
      logInfo(`${BUNDLE}SizeSummaryOf_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0093
     * @tc.name      WindowRatio_SizeSummaryOf_0093
     * @tc.desc      sizeSummaryOf(width=360, height=100) returns "360 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0093 begin`);
      const actual: string = sizeSummaryOf(360, 100);
      logInfo(`sizeSummaryOf(width=360, height=100): actual=${actual}`);
      expect(actual).assertEqual('360 x 100');
      logInfo(`${BUNDLE}SizeSummaryOf_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0094
     * @tc.name      WindowRatio_SizeSummaryOf_0094
     * @tc.desc      sizeSummaryOf(width=360, height=360) returns "360 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0094 begin`);
      const actual: string = sizeSummaryOf(360, 360);
      logInfo(`sizeSummaryOf(width=360, height=360): actual=${actual}`);
      expect(actual).assertEqual('360 x 360');
      logInfo(`${BUNDLE}SizeSummaryOf_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0095
     * @tc.name      WindowRatio_SizeSummaryOf_0095
     * @tc.desc      sizeSummaryOf(width=360, height=720) returns "360 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0095 begin`);
      const actual: string = sizeSummaryOf(360, 720);
      logInfo(`sizeSummaryOf(width=360, height=720): actual=${actual}`);
      expect(actual).assertEqual('360 x 720');
      logInfo(`${BUNDLE}SizeSummaryOf_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_SUMMARY_OF_0096
     * @tc.name      WindowRatio_SizeSummaryOf_0096
     * @tc.desc      sizeSummaryOf(width=360, height=1080) returns "360 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeSummaryOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeSummaryOf_0096 begin`);
      const actual: string = sizeSummaryOf(360, 1080);
      logInfo(`sizeSummaryOf(width=360, height=1080): actual=${actual}`);
      expect(actual).assertEqual('360 x 1080');
      logInfo(`${BUNDLE}SizeSummaryOf_0096 end`);
    });
  });
}
