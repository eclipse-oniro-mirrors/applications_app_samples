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
import { breakpointOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for breakpointOf (75 cases). */
export default function breakpointOfTest(): void {
  describe('BreakpointOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0001
     * @tc.name      FoldableAdaptation_BreakpointOf_0001
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('BreakpointOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BreakpointOf_0001 begin`);
      const actual: string = breakpointOf(0, 1);
      logInfo(`breakpointOf(windowWidth=0, densityPixels=1): actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0002
     * @tc.name      FoldableAdaptation_BreakpointOf_0002
     * @tc.desc      breakpointOf(windowWidth=720, densityPixels=1) returns "md"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('BreakpointOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BreakpointOf_0002 begin`);
      const actual: string = breakpointOf(720, 1);
      logInfo(`breakpointOf(windowWidth=720, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('md');
      logInfo(`${BUNDLE}BreakpointOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0003
     * @tc.name      FoldableAdaptation_BreakpointOf_0003
     * @tc.desc      breakpointOf(windowWidth=1080, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0003 begin`);
      const actual: string = breakpointOf(1080, 1);
      logInfo(`breakpointOf(windowWidth=1080, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0004
     * @tc.name      FoldableAdaptation_BreakpointOf_0004
     * @tc.desc      breakpointOf(windowWidth=1, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0004 begin`);
      const actual: string = breakpointOf(1, 1);
      logInfo(`breakpointOf(windowWidth=1, densityPixels=1): actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0005
     * @tc.name      FoldableAdaptation_BreakpointOf_0005
     * @tc.desc      breakpointOf(windowWidth=2, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0005 begin`);
      const actual: string = breakpointOf(2, 1);
      logInfo(`breakpointOf(windowWidth=2, densityPixels=1): actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0006
     * @tc.name      FoldableAdaptation_BreakpointOf_0006
     * @tc.desc      breakpointOf(windowWidth=3, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0006 begin`);
      const actual: string = breakpointOf(3, 1);
      logInfo(`breakpointOf(windowWidth=3, densityPixels=1): actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0007
     * @tc.name      FoldableAdaptation_BreakpointOf_0007
     * @tc.desc      breakpointOf(windowWidth=100, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0007 begin`);
      const actual: string = breakpointOf(100, 1);
      logInfo(`breakpointOf(windowWidth=100, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0008
     * @tc.name      FoldableAdaptation_BreakpointOf_0008
     * @tc.desc      breakpointOf(windowWidth=360, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0008 begin`);
      const actual: string = breakpointOf(360, 1);
      logInfo(`breakpointOf(windowWidth=360, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0009
     * @tc.name      FoldableAdaptation_BreakpointOf_0009
     * @tc.desc      breakpointOf(windowWidth=1920, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0009 begin`);
      const actual: string = breakpointOf(1920, 1);
      logInfo(`breakpointOf(windowWidth=1920, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0010
     * @tc.name      FoldableAdaptation_BreakpointOf_0010
     * @tc.desc      breakpointOf(windowWidth=-1, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('BreakpointOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BreakpointOf_0010 begin`);
      const actual: string = breakpointOf(-1, 1);
      logInfo(`breakpointOf(windowWidth=-1, densityPixel...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0011
     * @tc.name      FoldableAdaptation_BreakpointOf_0011
     * @tc.desc      breakpointOf(windowWidth=10, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0011 begin`);
      const actual: string = breakpointOf(10, 1);
      logInfo(`breakpointOf(windowWidth=10, densityPixel...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0012
     * @tc.name      FoldableAdaptation_BreakpointOf_0012
     * @tc.desc      breakpointOf(windowWidth=96, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0012 begin`);
      const actual: string = breakpointOf(96, 1);
      logInfo(`breakpointOf(windowWidth=96, densityPixel...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0013
     * @tc.name      FoldableAdaptation_BreakpointOf_0013
     * @tc.desc      breakpointOf(windowWidth=192, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0013 begin`);
      const actual: string = breakpointOf(192, 1);
      logInfo(`breakpointOf(windowWidth=192, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0014
     * @tc.name      FoldableAdaptation_BreakpointOf_0014
     * @tc.desc      breakpointOf(windowWidth=288, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0014 begin`);
      const actual: string = breakpointOf(288, 1);
      logInfo(`breakpointOf(windowWidth=288, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0015
     * @tc.name      FoldableAdaptation_BreakpointOf_0015
     * @tc.desc      breakpointOf(windowWidth=384, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0015 begin`);
      const actual: string = breakpointOf(384, 1);
      logInfo(`breakpointOf(windowWidth=384, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0016
     * @tc.name      FoldableAdaptation_BreakpointOf_0016
     * @tc.desc      breakpointOf(windowWidth=480, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0016 begin`);
      const actual: string = breakpointOf(480, 1);
      logInfo(`breakpointOf(windowWidth=480, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0017
     * @tc.name      FoldableAdaptation_BreakpointOf_0017
     * @tc.desc      breakpointOf(windowWidth=576, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0017 begin`);
      const actual: string = breakpointOf(576, 1);
      logInfo(`breakpointOf(windowWidth=576, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0018
     * @tc.name      FoldableAdaptation_BreakpointOf_0018
     * @tc.desc      breakpointOf(windowWidth=672, densityPixels=1) returns "md"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0018 begin`);
      const actual: string = breakpointOf(672, 1);
      logInfo(`breakpointOf(windowWidth=672, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('md');
      logInfo(`${BUNDLE}BreakpointOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0019
     * @tc.name      FoldableAdaptation_BreakpointOf_0019
     * @tc.desc      breakpointOf(windowWidth=768, densityPixels=1) returns "md"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0019 begin`);
      const actual: string = breakpointOf(768, 1);
      logInfo(`breakpointOf(windowWidth=768, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('md');
      logInfo(`${BUNDLE}BreakpointOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0020
     * @tc.name      FoldableAdaptation_BreakpointOf_0020
     * @tc.desc      breakpointOf(windowWidth=864, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0020 begin`);
      const actual: string = breakpointOf(864, 1);
      logInfo(`breakpointOf(windowWidth=864, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0021
     * @tc.name      FoldableAdaptation_BreakpointOf_0021
     * @tc.desc      breakpointOf(windowWidth=960, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0021 begin`);
      const actual: string = breakpointOf(960, 1);
      logInfo(`breakpointOf(windowWidth=960, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0022
     * @tc.name      FoldableAdaptation_BreakpointOf_0022
     * @tc.desc      breakpointOf(windowWidth=1056, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0022 begin`);
      const actual: string = breakpointOf(1056, 1);
      logInfo(`breakpointOf(windowWidth=1056, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0023
     * @tc.name      FoldableAdaptation_BreakpointOf_0023
     * @tc.desc      breakpointOf(windowWidth=1152, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0023 begin`);
      const actual: string = breakpointOf(1152, 1);
      logInfo(`breakpointOf(windowWidth=1152, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0024
     * @tc.name      FoldableAdaptation_BreakpointOf_0024
     * @tc.desc      breakpointOf(windowWidth=1248, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0024 begin`);
      const actual: string = breakpointOf(1248, 1);
      logInfo(`breakpointOf(windowWidth=1248, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0025
     * @tc.name      FoldableAdaptation_BreakpointOf_0025
     * @tc.desc      breakpointOf(windowWidth=1344, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0025 begin`);
      const actual: string = breakpointOf(1344, 1);
      logInfo(`breakpointOf(windowWidth=1344, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0026
     * @tc.name      FoldableAdaptation_BreakpointOf_0026
     * @tc.desc      breakpointOf(windowWidth=1440, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0026 begin`);
      const actual: string = breakpointOf(1440, 1);
      logInfo(`breakpointOf(windowWidth=1440, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0027
     * @tc.name      FoldableAdaptation_BreakpointOf_0027
     * @tc.desc      breakpointOf(windowWidth=1536, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0027 begin`);
      const actual: string = breakpointOf(1536, 1);
      logInfo(`breakpointOf(windowWidth=1536, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0028
     * @tc.name      FoldableAdaptation_BreakpointOf_0028
     * @tc.desc      breakpointOf(windowWidth=1632, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0028 begin`);
      const actual: string = breakpointOf(1632, 1);
      logInfo(`breakpointOf(windowWidth=1632, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0029
     * @tc.name      FoldableAdaptation_BreakpointOf_0029
     * @tc.desc      breakpointOf(windowWidth=1728, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0029 begin`);
      const actual: string = breakpointOf(1728, 1);
      logInfo(`breakpointOf(windowWidth=1728, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0030
     * @tc.name      FoldableAdaptation_BreakpointOf_0030
     * @tc.desc      breakpointOf(windowWidth=1824, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0030 begin`);
      const actual: string = breakpointOf(1824, 1);
      logInfo(`breakpointOf(windowWidth=1824, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0031
     * @tc.name      FoldableAdaptation_BreakpointOf_0031
     * @tc.desc      breakpointOf(windowWidth=2016, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0031 begin`);
      const actual: string = breakpointOf(2016, 1);
      logInfo(`breakpointOf(windowWidth=2016, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0032
     * @tc.name      FoldableAdaptation_BreakpointOf_0032
     * @tc.desc      breakpointOf(windowWidth=2112, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0032 begin`);
      const actual: string = breakpointOf(2112, 1);
      logInfo(`breakpointOf(windowWidth=2112, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0033
     * @tc.name      FoldableAdaptation_BreakpointOf_0033
     * @tc.desc      breakpointOf(windowWidth=2208, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0033 begin`);
      const actual: string = breakpointOf(2208, 1);
      logInfo(`breakpointOf(windowWidth=2208, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0034
     * @tc.name      FoldableAdaptation_BreakpointOf_0034
     * @tc.desc      breakpointOf(windowWidth=2304, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0034 begin`);
      const actual: string = breakpointOf(2304, 1);
      logInfo(`breakpointOf(windowWidth=2304, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0035
     * @tc.name      FoldableAdaptation_BreakpointOf_0035
     * @tc.desc      breakpointOf(windowWidth=2400, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0035 begin`);
      const actual: string = breakpointOf(2400, 1);
      logInfo(`breakpointOf(windowWidth=2400, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0036
     * @tc.name      FoldableAdaptation_BreakpointOf_0036
     * @tc.desc      breakpointOf(windowWidth=2496, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0036 begin`);
      const actual: string = breakpointOf(2496, 1);
      logInfo(`breakpointOf(windowWidth=2496, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0037
     * @tc.name      FoldableAdaptation_BreakpointOf_0037
     * @tc.desc      breakpointOf(windowWidth=2592, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0037 begin`);
      const actual: string = breakpointOf(2592, 1);
      logInfo(`breakpointOf(windowWidth=2592, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0038
     * @tc.name      FoldableAdaptation_BreakpointOf_0038
     * @tc.desc      breakpointOf(windowWidth=2688, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0038 begin`);
      const actual: string = breakpointOf(2688, 1);
      logInfo(`breakpointOf(windowWidth=2688, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0039
     * @tc.name      FoldableAdaptation_BreakpointOf_0039
     * @tc.desc      breakpointOf(windowWidth=2784, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0039 begin`);
      const actual: string = breakpointOf(2784, 1);
      logInfo(`breakpointOf(windowWidth=2784, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0040
     * @tc.name      FoldableAdaptation_BreakpointOf_0040
     * @tc.desc      breakpointOf(windowWidth=2880, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0040 begin`);
      const actual: string = breakpointOf(2880, 1);
      logInfo(`breakpointOf(windowWidth=2880, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0041
     * @tc.name      FoldableAdaptation_BreakpointOf_0041
     * @tc.desc      breakpointOf(windowWidth=2976, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0041 begin`);
      const actual: string = breakpointOf(2976, 1);
      logInfo(`breakpointOf(windowWidth=2976, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0042
     * @tc.name      FoldableAdaptation_BreakpointOf_0042
     * @tc.desc      breakpointOf(windowWidth=3072, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0042 begin`);
      const actual: string = breakpointOf(3072, 1);
      logInfo(`breakpointOf(windowWidth=3072, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0043
     * @tc.name      FoldableAdaptation_BreakpointOf_0043
     * @tc.desc      breakpointOf(windowWidth=3168, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0043 begin`);
      const actual: string = breakpointOf(3168, 1);
      logInfo(`breakpointOf(windowWidth=3168, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0044
     * @tc.name      FoldableAdaptation_BreakpointOf_0044
     * @tc.desc      breakpointOf(windowWidth=3264, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0044 begin`);
      const actual: string = breakpointOf(3264, 1);
      logInfo(`breakpointOf(windowWidth=3264, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0045
     * @tc.name      FoldableAdaptation_BreakpointOf_0045
     * @tc.desc      breakpointOf(windowWidth=3360, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0045 begin`);
      const actual: string = breakpointOf(3360, 1);
      logInfo(`breakpointOf(windowWidth=3360, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0046
     * @tc.name      FoldableAdaptation_BreakpointOf_0046
     * @tc.desc      breakpointOf(windowWidth=3456, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0046 begin`);
      const actual: string = breakpointOf(3456, 1);
      logInfo(`breakpointOf(windowWidth=3456, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0047
     * @tc.name      FoldableAdaptation_BreakpointOf_0047
     * @tc.desc      breakpointOf(windowWidth=3552, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0047 begin`);
      const actual: string = breakpointOf(3552, 1);
      logInfo(`breakpointOf(windowWidth=3552, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0048
     * @tc.name      FoldableAdaptation_BreakpointOf_0048
     * @tc.desc      breakpointOf(windowWidth=3648, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0048 begin`);
      const actual: string = breakpointOf(3648, 1);
      logInfo(`breakpointOf(windowWidth=3648, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0049
     * @tc.name      FoldableAdaptation_BreakpointOf_0049
     * @tc.desc      breakpointOf(windowWidth=3744, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0049 begin`);
      const actual: string = breakpointOf(3744, 1);
      logInfo(`breakpointOf(windowWidth=3744, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0050
     * @tc.name      FoldableAdaptation_BreakpointOf_0050
     * @tc.desc      breakpointOf(windowWidth=3840, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0050 begin`);
      const actual: string = breakpointOf(3840, 1);
      logInfo(`breakpointOf(windowWidth=3840, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0051
     * @tc.name      FoldableAdaptation_BreakpointOf_0051
     * @tc.desc      breakpointOf(windowWidth=193, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0051 begin`);
      const actual: string = breakpointOf(193, 1);
      logInfo(`breakpointOf(windowWidth=193, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0052
     * @tc.name      FoldableAdaptation_BreakpointOf_0052
     * @tc.desc      breakpointOf(windowWidth=-88, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('BreakpointOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BreakpointOf_0052 begin`);
      const actual: string = breakpointOf(-88, 1);
      logInfo(`breakpointOf(windowWidth=-88, densityPixe...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0053
     * @tc.name      FoldableAdaptation_BreakpointOf_0053
     * @tc.desc      breakpointOf(windowWidth=1025, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0053 begin`);
      const actual: string = breakpointOf(1025, 1);
      logInfo(`breakpointOf(windowWidth=1025, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0054
     * @tc.name      FoldableAdaptation_BreakpointOf_0054
     * @tc.desc      breakpointOf(windowWidth=-1441, densityPixels=1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('BreakpointOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BreakpointOf_0054 begin`);
      const actual: string = breakpointOf(-1441, 1);
      logInfo(`breakpointOf(windowWidth=-1441, densityPi...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0055
     * @tc.name      FoldableAdaptation_BreakpointOf_0055
     * @tc.desc      breakpointOf(windowWidth=1470.97, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0055 begin`);
      const actual: string = breakpointOf(1470.97, 1);
      logInfo(`breakpointOf(windowWidth=1470.97, density...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0056
     * @tc.name      FoldableAdaptation_BreakpointOf_0056
     * @tc.desc      breakpointOf(windowWidth=1090.77, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0056 begin`);
      const actual: string = breakpointOf(1090.77, 1);
      logInfo(`breakpointOf(windowWidth=1090.77, density...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0057
     * @tc.name      FoldableAdaptation_BreakpointOf_0057
     * @tc.desc      breakpointOf(windowWidth=689.47, densityPixels=1) returns "md"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0057 begin`);
      const actual: string = breakpointOf(689.47, 1);
      logInfo(`breakpointOf(windowWidth=689.47, densityP...: actual=${actual}`);
      expect(actual).assertEqual('md');
      logInfo(`${BUNDLE}BreakpointOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0058
     * @tc.name      FoldableAdaptation_BreakpointOf_0058
     * @tc.desc      breakpointOf(windowWidth=1174, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0058 begin`);
      const actual: string = breakpointOf(1174, 1);
      logInfo(`breakpointOf(windowWidth=1174, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0059
     * @tc.name      FoldableAdaptation_BreakpointOf_0059
     * @tc.desc      breakpointOf(windowWidth=3038, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0059 begin`);
      const actual: string = breakpointOf(3038, 1);
      logInfo(`breakpointOf(windowWidth=3038, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0060
     * @tc.name      FoldableAdaptation_BreakpointOf_0060
     * @tc.desc      breakpointOf(windowWidth=3691, densityPixels=1) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0060 begin`);
      const actual: string = breakpointOf(3691, 1);
      logInfo(`breakpointOf(windowWidth=3691, densityPix...: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0061
     * @tc.name      FoldableAdaptation_BreakpointOf_0061
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=0) returns "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0061 begin`);
      const actual: string = breakpointOf(0, 0);
      logInfo(`breakpointOf(windowWidth=0, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0062
     * @tc.name      FoldableAdaptation_BreakpointOf_0062
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=2) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0062 begin`);
      const actual: string = breakpointOf(0, 2);
      logInfo(`breakpointOf(windowWidth=0, densityPixels=2): actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0063
     * @tc.name      FoldableAdaptation_BreakpointOf_0063
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=3) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('BreakpointOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BreakpointOf_0063 begin`);
      const actual: string = breakpointOf(0, 3);
      logInfo(`breakpointOf(windowWidth=0, densityPixels=3): actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0064
     * @tc.name      FoldableAdaptation_BreakpointOf_0064
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=-1) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('BreakpointOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BreakpointOf_0064 begin`);
      const actual: string = breakpointOf(0, -1);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0065
     * @tc.name      FoldableAdaptation_BreakpointOf_0065
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=10) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0065 begin`);
      const actual: string = breakpointOf(0, 10);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0066
     * @tc.name      FoldableAdaptation_BreakpointOf_0066
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=100) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0066 begin`);
      const actual: string = breakpointOf(0, 100);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0067
     * @tc.name      FoldableAdaptation_BreakpointOf_0067
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=5) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0067 begin`);
      const actual: string = breakpointOf(0, 5);
      logInfo(`breakpointOf(windowWidth=0, densityPixels=5): actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0068
     * @tc.name      FoldableAdaptation_BreakpointOf_0068
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=15) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0068 begin`);
      const actual: string = breakpointOf(0, 15);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0069
     * @tc.name      FoldableAdaptation_BreakpointOf_0069
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=20) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0069 begin`);
      const actual: string = breakpointOf(0, 20);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0070
     * @tc.name      FoldableAdaptation_BreakpointOf_0070
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=25) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0070 begin`);
      const actual: string = breakpointOf(0, 25);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0071
     * @tc.name      FoldableAdaptation_BreakpointOf_0071
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=30) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0071 begin`);
      const actual: string = breakpointOf(0, 30);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0072
     * @tc.name      FoldableAdaptation_BreakpointOf_0072
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=35) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0072 begin`);
      const actual: string = breakpointOf(0, 35);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0073
     * @tc.name      FoldableAdaptation_BreakpointOf_0073
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=40) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0073 begin`);
      const actual: string = breakpointOf(0, 40);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0074
     * @tc.name      FoldableAdaptation_BreakpointOf_0074
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=45) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0074 begin`);
      const actual: string = breakpointOf(0, 45);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_OF_0075
     * @tc.name      FoldableAdaptation_BreakpointOf_0075
     * @tc.desc      breakpointOf(windowWidth=0, densityPixels=50) returns "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointOf_0075 begin`);
      const actual: string = breakpointOf(0, 50);
      logInfo(`breakpointOf(windowWidth=0, densityPixels...: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointOf_0075 end`);
    });
  });
}
