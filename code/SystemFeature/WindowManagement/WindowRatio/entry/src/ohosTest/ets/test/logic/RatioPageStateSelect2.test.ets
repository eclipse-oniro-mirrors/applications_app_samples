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
import { RatioPageState } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RatioPageState.select (53 cases). */
export default function ratioPageStateSelect2Test(): void {
  describe('RatioPageStateSelect2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0068
     * @tc.name      WindowRatio_RatioPageStateSelect_0068
     * @tc.desc      RatioPageState.select(index=-2) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0068 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-2);
      logInfo(`select(index=-2): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-2) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-2);
      logInfo(`select(index=-2) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-2) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0069
     * @tc.name      WindowRatio_RatioPageStateSelect_0069
     * @tc.desc      RatioPageState.select(index=-15) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0069 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-15);
      logInfo(`select(index=-15): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-15) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-15);
      logInfo(`select(index=-15) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-15) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0070
     * @tc.name      WindowRatio_RatioPageStateSelect_0070
     * @tc.desc      RatioPageState.select(index=-64) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0070 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-64);
      logInfo(`select(index=-64): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-64) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-64);
      logInfo(`select(index=-64) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-64) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0071
     * @tc.name      WindowRatio_RatioPageStateSelect_0071
     * @tc.desc      RatioPageState.select(index=79) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0071 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(79);
      logInfo(`select(index=79): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=79) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(79);
      logInfo(`select(index=79) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=79) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0072
     * @tc.name      WindowRatio_RatioPageStateSelect_0072
     * @tc.desc      RatioPageState.select(index=157) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0072 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(157);
      logInfo(`select(index=157): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=157) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(157);
      logInfo(`select(index=157) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=157) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0073
     * @tc.name      WindowRatio_RatioPageStateSelect_0073
     * @tc.desc      RatioPageState.select(index=16.18) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0073 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(16.18);
      logInfo(`select(index=16.18): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=16.18) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(16.18, PRECISION);
      logInfo(`select(index=16.18) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=16.18) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0074
     * @tc.name      WindowRatio_RatioPageStateSelect_0074
     * @tc.desc      RatioPageState.select(index=152) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0074 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(152);
      logInfo(`select(index=152): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=152) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(152);
      logInfo(`select(index=152) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=152) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0075
     * @tc.name      WindowRatio_RatioPageStateSelect_0075
     * @tc.desc      RatioPageState.select(index=62) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0075 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(62);
      logInfo(`select(index=62): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=62) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(62);
      logInfo(`select(index=62) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=62) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0076
     * @tc.name      WindowRatio_RatioPageStateSelect_0076
     * @tc.desc      RatioPageState.select(index=76) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0076 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(76);
      logInfo(`select(index=76): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=76) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(76);
      logInfo(`select(index=76) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=76) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0077
     * @tc.name      WindowRatio_RatioPageStateSelect_0077
     * @tc.desc      RatioPageState.select(index=52) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0077 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(52);
      logInfo(`select(index=52): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=52) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(52);
      logInfo(`select(index=52) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=52) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0078
     * @tc.name      WindowRatio_RatioPageStateSelect_0078
     * @tc.desc      RatioPageState.select(index=123) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0078 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(123);
      logInfo(`select(index=123): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=123) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(123);
      logInfo(`select(index=123) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=123) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0079
     * @tc.name      WindowRatio_RatioPageStateSelect_0079
     * @tc.desc      RatioPageState.select(index=65.16) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0079 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(65.16);
      logInfo(`select(index=65.16): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=65.16) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(65.16, PRECISION);
      logInfo(`select(index=65.16) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=65.16) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0080
     * @tc.name      WindowRatio_RatioPageStateSelect_0080
     * @tc.desc      RatioPageState.select(index=87.89) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0080 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(87.89);
      logInfo(`select(index=87.89): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=87.89) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(87.89, PRECISION);
      logInfo(`select(index=87.89) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=87.89) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0081
     * @tc.name      WindowRatio_RatioPageStateSelect_0081
     * @tc.desc      RatioPageState.select(index=126) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0081 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(126);
      logInfo(`select(index=126): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=126) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(126);
      logInfo(`select(index=126) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=126) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0082
     * @tc.name      WindowRatio_RatioPageStateSelect_0082
     * @tc.desc      RatioPageState.select(index=-54) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0082 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-54);
      logInfo(`select(index=-54): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-54) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-54);
      logInfo(`select(index=-54) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-54) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0083
     * @tc.name      WindowRatio_RatioPageStateSelect_0083
     * @tc.desc      RatioPageState.select(index=17) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0083 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(17);
      logInfo(`select(index=17): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=17) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(17);
      logInfo(`select(index=17) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=17) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0084
     * @tc.name      WindowRatio_RatioPageStateSelect_0084
     * @tc.desc      RatioPageState.select(index=193) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0084 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(193);
      logInfo(`select(index=193): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=193) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(193);
      logInfo(`select(index=193) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=193) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0085
     * @tc.name      WindowRatio_RatioPageStateSelect_0085
     * @tc.desc      RatioPageState.select(index=77.16) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0085 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(77.16);
      logInfo(`select(index=77.16): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=77.16) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(77.16, PRECISION);
      logInfo(`select(index=77.16) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=77.16) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0086
     * @tc.name      WindowRatio_RatioPageStateSelect_0086
     * @tc.desc      RatioPageState.select(index=19) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0086 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(19);
      logInfo(`select(index=19): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=19) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(19);
      logInfo(`select(index=19) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=19) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0087
     * @tc.name      WindowRatio_RatioPageStateSelect_0087
     * @tc.desc      RatioPageState.select(index=65.28) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0087 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(65.28);
      logInfo(`select(index=65.28): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=65.28) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(65.28, PRECISION);
      logInfo(`select(index=65.28) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=65.28) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0088
     * @tc.name      WindowRatio_RatioPageStateSelect_0088
     * @tc.desc      RatioPageState.select(index=48.44) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0088 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(48.44);
      logInfo(`select(index=48.44): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=48.44) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(48.44, PRECISION);
      logInfo(`select(index=48.44) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=48.44) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0089
     * @tc.name      WindowRatio_RatioPageStateSelect_0089
     * @tc.desc      RatioPageState.select(index=-20) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0089 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-20);
      logInfo(`select(index=-20): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-20) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-20);
      logInfo(`select(index=-20) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-20) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0090
     * @tc.name      WindowRatio_RatioPageStateSelect_0090
     * @tc.desc      RatioPageState.select(index=-17) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0090 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-17);
      logInfo(`select(index=-17): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-17) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-17);
      logInfo(`select(index=-17) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-17) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0091
     * @tc.name      WindowRatio_RatioPageStateSelect_0091
     * @tc.desc      RatioPageState.select(index=49.7) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0091 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(49.7);
      logInfo(`select(index=49.7): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=49.7) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(49.7, PRECISION);
      logInfo(`select(index=49.7) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=49.7) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0092
     * @tc.name      WindowRatio_RatioPageStateSelect_0092
     * @tc.desc      RatioPageState.select(index=-48) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0092 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-48);
      logInfo(`select(index=-48): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-48) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-48);
      logInfo(`select(index=-48) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-48) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0093
     * @tc.name      WindowRatio_RatioPageStateSelect_0093
     * @tc.desc      RatioPageState.select(index=144) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0093 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(144);
      logInfo(`select(index=144): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=144) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(144);
      logInfo(`select(index=144) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=144) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0094
     * @tc.name      WindowRatio_RatioPageStateSelect_0094
     * @tc.desc      RatioPageState.select(index=99) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0094 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(99);
      logInfo(`select(index=99): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=99) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(99);
      logInfo(`select(index=99) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=99) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0095
     * @tc.name      WindowRatio_RatioPageStateSelect_0095
     * @tc.desc      RatioPageState.select(index=147) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0095 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(147);
      logInfo(`select(index=147): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=147) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(147);
      logInfo(`select(index=147) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=147) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0096
     * @tc.name      WindowRatio_RatioPageStateSelect_0096
     * @tc.desc      RatioPageState.select(index=91) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0096 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(91);
      logInfo(`select(index=91): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=91) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(91);
      logInfo(`select(index=91) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=91) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0096 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0097
     * @tc.name      WindowRatio_RatioPageStateSelect_0097
     * @tc.desc      RatioPageState.select(index=24) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0097 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(24);
      logInfo(`select(index=24): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=24) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(24);
      logInfo(`select(index=24) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=24) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0098
     * @tc.name      WindowRatio_RatioPageStateSelect_0098
     * @tc.desc      RatioPageState.select(index=85.78) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0098 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(85.78);
      logInfo(`select(index=85.78): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=85.78) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(85.78, PRECISION);
      logInfo(`select(index=85.78) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=85.78) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0099
     * @tc.name      WindowRatio_RatioPageStateSelect_0099
     * @tc.desc      RatioPageState.select(index=32.62) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0099 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(32.62);
      logInfo(`select(index=32.62): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=32.62) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(32.62, PRECISION);
      logInfo(`select(index=32.62) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=32.62) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0100
     * @tc.name      WindowRatio_RatioPageStateSelect_0100
     * @tc.desc      RatioPageState.select(index=109) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0100 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(109);
      logInfo(`select(index=109): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=109) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(109);
      logInfo(`select(index=109) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=109) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0101
     * @tc.name      WindowRatio_RatioPageStateSelect_0101
     * @tc.desc      RatioPageState.select(index=-86) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0101 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-86);
      logInfo(`select(index=-86): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-86) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-86);
      logInfo(`select(index=-86) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-86) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0102
     * @tc.name      WindowRatio_RatioPageStateSelect_0102
     * @tc.desc      RatioPageState.select(index=82.48) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0102 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(82.48);
      logInfo(`select(index=82.48): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=82.48) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(82.48, PRECISION);
      logInfo(`select(index=82.48) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=82.48) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0103
     * @tc.name      WindowRatio_RatioPageStateSelect_0103
     * @tc.desc      RatioPageState.select(index=128) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0103 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(128);
      logInfo(`select(index=128): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=128) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(128);
      logInfo(`select(index=128) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=128) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0104
     * @tc.name      WindowRatio_RatioPageStateSelect_0104
     * @tc.desc      RatioPageState.select(index=39) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0104 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(39);
      logInfo(`select(index=39): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=39) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(39);
      logInfo(`select(index=39) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=39) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0105
     * @tc.name      WindowRatio_RatioPageStateSelect_0105
     * @tc.desc      RatioPageState.select(index=173) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0105 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(173);
      logInfo(`select(index=173): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=173) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(173);
      logInfo(`select(index=173) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=173) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0106
     * @tc.name      WindowRatio_RatioPageStateSelect_0106
     * @tc.desc      RatioPageState.select(index=28) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0106 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(28);
      logInfo(`select(index=28): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=28) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(28);
      logInfo(`select(index=28) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=28) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0107
     * @tc.name      WindowRatio_RatioPageStateSelect_0107
     * @tc.desc      RatioPageState.select(index=-37) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0107 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-37);
      logInfo(`select(index=-37): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-37) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-37);
      logInfo(`select(index=-37) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-37) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0108
     * @tc.name      WindowRatio_RatioPageStateSelect_0108
     * @tc.desc      RatioPageState.select(index=98.51) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0108 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(98.51);
      logInfo(`select(index=98.51): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=98.51) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(98.51, PRECISION);
      logInfo(`select(index=98.51) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=98.51) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0109
     * @tc.name      WindowRatio_RatioPageStateSelect_0109
     * @tc.desc      RatioPageState.select(index=89.01) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0109 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(89.01);
      logInfo(`select(index=89.01): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=89.01) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(89.01, PRECISION);
      logInfo(`select(index=89.01) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=89.01) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0110
     * @tc.name      WindowRatio_RatioPageStateSelect_0110
     * @tc.desc      RatioPageState.select(index=56.11) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0110 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(56.11);
      logInfo(`select(index=56.11): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=56.11) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(56.11, PRECISION);
      logInfo(`select(index=56.11) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=56.11) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0111
     * @tc.name      WindowRatio_RatioPageStateSelect_0111
     * @tc.desc      RatioPageState.select(index=14) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0111 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(14);
      logInfo(`select(index=14): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=14) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(14);
      logInfo(`select(index=14) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=14) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0112
     * @tc.name      WindowRatio_RatioPageStateSelect_0112
     * @tc.desc      RatioPageState.select(index=171) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0112 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(171);
      logInfo(`select(index=171): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=171) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(171);
      logInfo(`select(index=171) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=171) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0113
     * @tc.name      WindowRatio_RatioPageStateSelect_0113
     * @tc.desc      RatioPageState.select(index=178) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0113 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(178);
      logInfo(`select(index=178): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=178) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(178);
      logInfo(`select(index=178) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=178) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0114
     * @tc.name      WindowRatio_RatioPageStateSelect_0114
     * @tc.desc      RatioPageState.select(index=78) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0114 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(78);
      logInfo(`select(index=78): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=78) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(78);
      logInfo(`select(index=78) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=78) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0115
     * @tc.name      WindowRatio_RatioPageStateSelect_0115
     * @tc.desc      RatioPageState.select(index=60.46) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0115 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(60.46);
      logInfo(`select(index=60.46): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=60.46) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(60.46, PRECISION);
      logInfo(`select(index=60.46) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=60.46) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0116
     * @tc.name      WindowRatio_RatioPageStateSelect_0116
     * @tc.desc      RatioPageState.select(index=-19) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0116 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-19);
      logInfo(`select(index=-19): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-19) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-19);
      logInfo(`select(index=-19) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-19) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0117
     * @tc.name      WindowRatio_RatioPageStateSelect_0117
     * @tc.desc      RatioPageState.select(index=172) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0117 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(172);
      logInfo(`select(index=172): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=172) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(172);
      logInfo(`select(index=172) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=172) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0118
     * @tc.name      WindowRatio_RatioPageStateSelect_0118
     * @tc.desc      RatioPageState.select(index=4.79) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0118 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(4.79);
      logInfo(`select(index=4.79): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=4.79) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(4.79, PRECISION);
      logInfo(`select(index=4.79) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=4.79) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0119
     * @tc.name      WindowRatio_RatioPageStateSelect_0119
     * @tc.desc      RatioPageState.select(index=113) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0119 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(113);
      logInfo(`select(index=113): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=113) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(113);
      logInfo(`select(index=113) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=113) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0120
     * @tc.name      WindowRatio_RatioPageStateSelect_0120
     * @tc.desc      RatioPageState.select(index=-11) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0120 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-11);
      logInfo(`select(index=-11): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-11) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-11);
      logInfo(`select(index=-11) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-11) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0120 end`);
    });
  });
}
