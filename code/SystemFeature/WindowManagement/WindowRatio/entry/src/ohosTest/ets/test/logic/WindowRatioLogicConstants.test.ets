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
import {
  DEFAULT_RATIO_LABEL, MAIN_PAGE, RATIO_16_9, RATIO_1_1, RATIO_4_3, UNKNOWN_SIZE
} from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for WindowRatioLogic (6 cases). */
export default function windowRatioLogicConstantsTest(): void {
  describe('WindowRatioLogicConstantsTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOW_RATIO_LOGIC_CONSTANTS_0001
     * @tc.name      WindowRatio_WindowRatioLogicConstants_0001
     * @tc.desc      RATIO_4_3 keeps value 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_WindowRatioLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0001 begin`);
      const actual: number = RATIO_4_3;
      logInfo(`RATIO_4_3: actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOW_RATIO_LOGIC_CONSTANTS_0002
     * @tc.name      WindowRatio_WindowRatioLogicConstants_0002
     * @tc.desc      RATIO_1_1 keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_WindowRatioLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0002 begin`);
      const actual: number = RATIO_1_1;
      logInfo(`RATIO_1_1: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOW_RATIO_LOGIC_CONSTANTS_0003
     * @tc.name      WindowRatio_WindowRatioLogicConstants_0003
     * @tc.desc      RATIO_16_9 keeps value 1.7777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WindowRatioLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0003 begin`);
      const actual: number = RATIO_16_9;
      logInfo(`RATIO_16_9: actual=${actual}`);
      expect(actual).assertClose(1.7777777777777777, PRECISION);
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOW_RATIO_LOGIC_CONSTANTS_0004
     * @tc.name      WindowRatio_WindowRatioLogicConstants_0004
     * @tc.desc      DEFAULT_RATIO_LABEL keeps value "4:3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WindowRatioLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0004 begin`);
      const actual: string = DEFAULT_RATIO_LABEL;
      logInfo(`DEFAULT_RATIO_LABEL: actual=${actual}`);
      expect(actual).assertEqual('4:3');
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOW_RATIO_LOGIC_CONSTANTS_0005
     * @tc.name      WindowRatio_WindowRatioLogicConstants_0005
     * @tc.desc      UNKNOWN_SIZE keeps value "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WindowRatioLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0005 begin`);
      const actual: string = UNKNOWN_SIZE;
      logInfo(`UNKNOWN_SIZE: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOW_RATIO_LOGIC_CONSTANTS_0006
     * @tc.name      WindowRatio_WindowRatioLogicConstants_0006
     * @tc.desc      MAIN_PAGE keeps value "pages/index"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WindowRatioLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0006 begin`);
      const actual: string = MAIN_PAGE;
      logInfo(`MAIN_PAGE: actual=${actual}`);
      expect(actual).assertEqual('pages/index');
      logInfo(`${BUNDLE}WindowRatioLogicConstants_0006 end`);
    });
  });
}
