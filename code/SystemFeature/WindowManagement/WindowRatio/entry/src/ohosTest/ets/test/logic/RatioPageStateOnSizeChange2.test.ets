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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RatioPageState.onSizeChange (73 cases). */
export default function ratioPageStateOnSizeChange2Test(): void {
  describe('RatioPageStateOnSizeChange2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0074
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0074
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=288) yields "100 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0074 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 288);
      logInfo(`onSizeChange(width=100, height=288): actual=${actual}`);
      expect(actual).assertEqual('100 x 288');
      logInfo(`onSizeChange(width=100, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0075
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0075
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=384) yields "100 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0075 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 384);
      logInfo(`onSizeChange(width=100, height=384): actual=${actual}`);
      expect(actual).assertEqual('100 x 384');
      logInfo(`onSizeChange(width=100, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0076
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0076
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=480) yields "100 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0076 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 480);
      logInfo(`onSizeChange(width=100, height=480): actual=${actual}`);
      expect(actual).assertEqual('100 x 480');
      logInfo(`onSizeChange(width=100, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0077
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0077
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=576) yields "100 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0077 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 576);
      logInfo(`onSizeChange(width=100, height=576): actual=${actual}`);
      expect(actual).assertEqual('100 x 576');
      logInfo(`onSizeChange(width=100, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0078
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0078
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=672) yields "100 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0078 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 672);
      logInfo(`onSizeChange(width=100, height=672): actual=${actual}`);
      expect(actual).assertEqual('100 x 672');
      logInfo(`onSizeChange(width=100, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0079
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0079
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=768) yields "100 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0079 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 768);
      logInfo(`onSizeChange(width=100, height=768): actual=${actual}`);
      expect(actual).assertEqual('100 x 768');
      logInfo(`onSizeChange(width=100, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0080
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0080
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=864) yields "100 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0080 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 864);
      logInfo(`onSizeChange(width=100, height=864): actual=${actual}`);
      expect(actual).assertEqual('100 x 864');
      logInfo(`onSizeChange(width=100, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0081
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0081
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=960) yields "100 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0081 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 960);
      logInfo(`onSizeChange(width=100, height=960): actual=${actual}`);
      expect(actual).assertEqual('100 x 960');
      logInfo(`onSizeChange(width=100, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0082
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0082
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1056) yields "100 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0082 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1056);
      logInfo(`onSizeChange(width=100, height=1056): actual=${actual}`);
      expect(actual).assertEqual('100 x 1056');
      logInfo(`onSizeChange(width=100, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0083
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0083
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1152) yields "100 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0083 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1152);
      logInfo(`onSizeChange(width=100, height=1152): actual=${actual}`);
      expect(actual).assertEqual('100 x 1152');
      logInfo(`onSizeChange(width=100, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0084
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0084
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1248) yields "100 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0084 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1248);
      logInfo(`onSizeChange(width=100, height=1248): actual=${actual}`);
      expect(actual).assertEqual('100 x 1248');
      logInfo(`onSizeChange(width=100, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0085
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0085
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1344) yields "100 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0085 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1344);
      logInfo(`onSizeChange(width=100, height=1344): actual=${actual}`);
      expect(actual).assertEqual('100 x 1344');
      logInfo(`onSizeChange(width=100, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0086
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0086
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1440) yields "100 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0086 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1440);
      logInfo(`onSizeChange(width=100, height=1440): actual=${actual}`);
      expect(actual).assertEqual('100 x 1440');
      logInfo(`onSizeChange(width=100, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0087
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0087
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1536) yields "100 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0087 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1536);
      logInfo(`onSizeChange(width=100, height=1536): actual=${actual}`);
      expect(actual).assertEqual('100 x 1536');
      logInfo(`onSizeChange(width=100, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0088
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0088
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1632) yields "100 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0088 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1632);
      logInfo(`onSizeChange(width=100, height=1632): actual=${actual}`);
      expect(actual).assertEqual('100 x 1632');
      logInfo(`onSizeChange(width=100, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0089
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0089
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1728) yields "100 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0089 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1728);
      logInfo(`onSizeChange(width=100, height=1728): actual=${actual}`);
      expect(actual).assertEqual('100 x 1728');
      logInfo(`onSizeChange(width=100, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0090
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0090
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1824) yields "100 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0090 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1824);
      logInfo(`onSizeChange(width=100, height=1824): actual=${actual}`);
      expect(actual).assertEqual('100 x 1824');
      logInfo(`onSizeChange(width=100, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0091
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0091
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=0) yields "360 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0091 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 0);
      logInfo(`onSizeChange(width=360, height=0): actual=${actual}`);
      expect(actual).assertEqual('360 x 0');
      logInfo(`onSizeChange(width=360, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0092
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0092
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1) yields "360 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0092 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1);
      logInfo(`onSizeChange(width=360, height=1): actual=${actual}`);
      expect(actual).assertEqual('360 x 1');
      logInfo(`onSizeChange(width=360, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0093
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0093
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=100) yields "360 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0093 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 100);
      logInfo(`onSizeChange(width=360, height=100): actual=${actual}`);
      expect(actual).assertEqual('360 x 100');
      logInfo(`onSizeChange(width=360, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0094
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0094
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=360) yields "360 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0094 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 360);
      logInfo(`onSizeChange(width=360, height=360): actual=${actual}`);
      expect(actual).assertEqual('360 x 360');
      logInfo(`onSizeChange(width=360, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0095
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0095
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=720) yields "360 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0095 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 720);
      logInfo(`onSizeChange(width=360, height=720): actual=${actual}`);
      expect(actual).assertEqual('360 x 720');
      logInfo(`onSizeChange(width=360, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0096
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0096
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1080) yields "360 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0096 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1080);
      logInfo(`onSizeChange(width=360, height=1080): actual=${actual}`);
      expect(actual).assertEqual('360 x 1080');
      logInfo(`onSizeChange(width=360, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0096 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0097
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0097
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1920) yields "360 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0097 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1920);
      logInfo(`onSizeChange(width=360, height=1920): actual=${actual}`);
      expect(actual).assertEqual('360 x 1920');
      logInfo(`onSizeChange(width=360, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0098
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0098
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=-1) yields "360 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0098 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, -1);
      logInfo(`onSizeChange(width=360, height=-1): actual=${actual}`);
      expect(actual).assertEqual('360 x -1');
      logInfo(`onSizeChange(width=360, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0099
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0099
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=2) yields "360 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0099 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 2);
      logInfo(`onSizeChange(width=360, height=2): actual=${actual}`);
      expect(actual).assertEqual('360 x 2');
      logInfo(`onSizeChange(width=360, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0100
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0100
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=3) yields "360 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0100 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 3);
      logInfo(`onSizeChange(width=360, height=3): actual=${actual}`);
      expect(actual).assertEqual('360 x 3');
      logInfo(`onSizeChange(width=360, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0101
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0101
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=10) yields "360 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0101 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 10);
      logInfo(`onSizeChange(width=360, height=10): actual=${actual}`);
      expect(actual).assertEqual('360 x 10');
      logInfo(`onSizeChange(width=360, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0102
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0102
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=96) yields "360 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0102 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 96);
      logInfo(`onSizeChange(width=360, height=96): actual=${actual}`);
      expect(actual).assertEqual('360 x 96');
      logInfo(`onSizeChange(width=360, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0103
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0103
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=192) yields "360 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0103 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 192);
      logInfo(`onSizeChange(width=360, height=192): actual=${actual}`);
      expect(actual).assertEqual('360 x 192');
      logInfo(`onSizeChange(width=360, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0104
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0104
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=288) yields "360 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0104 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 288);
      logInfo(`onSizeChange(width=360, height=288): actual=${actual}`);
      expect(actual).assertEqual('360 x 288');
      logInfo(`onSizeChange(width=360, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0105
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0105
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=384) yields "360 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0105 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 384);
      logInfo(`onSizeChange(width=360, height=384): actual=${actual}`);
      expect(actual).assertEqual('360 x 384');
      logInfo(`onSizeChange(width=360, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0106
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0106
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=480) yields "360 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0106 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 480);
      logInfo(`onSizeChange(width=360, height=480): actual=${actual}`);
      expect(actual).assertEqual('360 x 480');
      logInfo(`onSizeChange(width=360, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0107
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0107
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=576) yields "360 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0107 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 576);
      logInfo(`onSizeChange(width=360, height=576): actual=${actual}`);
      expect(actual).assertEqual('360 x 576');
      logInfo(`onSizeChange(width=360, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0108
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0108
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=672) yields "360 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0108 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 672);
      logInfo(`onSizeChange(width=360, height=672): actual=${actual}`);
      expect(actual).assertEqual('360 x 672');
      logInfo(`onSizeChange(width=360, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0109
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0109
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=768) yields "360 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0109 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 768);
      logInfo(`onSizeChange(width=360, height=768): actual=${actual}`);
      expect(actual).assertEqual('360 x 768');
      logInfo(`onSizeChange(width=360, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0110
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0110
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=864) yields "360 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0110 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 864);
      logInfo(`onSizeChange(width=360, height=864): actual=${actual}`);
      expect(actual).assertEqual('360 x 864');
      logInfo(`onSizeChange(width=360, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0111
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0111
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=960) yields "360 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0111 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 960);
      logInfo(`onSizeChange(width=360, height=960): actual=${actual}`);
      expect(actual).assertEqual('360 x 960');
      logInfo(`onSizeChange(width=360, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0112
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0112
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1056) yields "360 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0112 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1056);
      logInfo(`onSizeChange(width=360, height=1056): actual=${actual}`);
      expect(actual).assertEqual('360 x 1056');
      logInfo(`onSizeChange(width=360, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0113
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0113
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1152) yields "360 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0113 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1152);
      logInfo(`onSizeChange(width=360, height=1152): actual=${actual}`);
      expect(actual).assertEqual('360 x 1152');
      logInfo(`onSizeChange(width=360, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0114
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0114
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1248) yields "360 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0114 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1248);
      logInfo(`onSizeChange(width=360, height=1248): actual=${actual}`);
      expect(actual).assertEqual('360 x 1248');
      logInfo(`onSizeChange(width=360, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0115
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0115
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1344) yields "360 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0115 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1344);
      logInfo(`onSizeChange(width=360, height=1344): actual=${actual}`);
      expect(actual).assertEqual('360 x 1344');
      logInfo(`onSizeChange(width=360, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0116
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0116
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1440) yields "360 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0116 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1440);
      logInfo(`onSizeChange(width=360, height=1440): actual=${actual}`);
      expect(actual).assertEqual('360 x 1440');
      logInfo(`onSizeChange(width=360, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0117
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0117
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1536) yields "360 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0117 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1536);
      logInfo(`onSizeChange(width=360, height=1536): actual=${actual}`);
      expect(actual).assertEqual('360 x 1536');
      logInfo(`onSizeChange(width=360, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0118
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0118
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1632) yields "360 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0118 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1632);
      logInfo(`onSizeChange(width=360, height=1632): actual=${actual}`);
      expect(actual).assertEqual('360 x 1632');
      logInfo(`onSizeChange(width=360, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0119
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0119
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1728) yields "360 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0119 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1728);
      logInfo(`onSizeChange(width=360, height=1728): actual=${actual}`);
      expect(actual).assertEqual('360 x 1728');
      logInfo(`onSizeChange(width=360, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0120
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0120
     * @tc.desc      RatioPageState.onSizeChange(width=360, height=1824) yields "360 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0120 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(360, 1824);
      logInfo(`onSizeChange(width=360, height=1824): actual=${actual}`);
      expect(actual).assertEqual('360 x 1824');
      logInfo(`onSizeChange(width=360, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange(width=360, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0121
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0121
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=0) yields "720 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0121 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 0);
      logInfo(`onSizeChange(width=720, height=0): actual=${actual}`);
      expect(actual).assertEqual('720 x 0');
      logInfo(`onSizeChange(width=720, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0122
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0122
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1) yields "720 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0122 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1);
      logInfo(`onSizeChange(width=720, height=1): actual=${actual}`);
      expect(actual).assertEqual('720 x 1');
      logInfo(`onSizeChange(width=720, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0123
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0123
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=100) yields "720 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0123 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 100);
      logInfo(`onSizeChange(width=720, height=100): actual=${actual}`);
      expect(actual).assertEqual('720 x 100');
      logInfo(`onSizeChange(width=720, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0124
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0124
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=360) yields "720 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0124 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 360);
      logInfo(`onSizeChange(width=720, height=360): actual=${actual}`);
      expect(actual).assertEqual('720 x 360');
      logInfo(`onSizeChange(width=720, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0125
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0125
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=720) yields "720 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0125 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 720);
      logInfo(`onSizeChange(width=720, height=720): actual=${actual}`);
      expect(actual).assertEqual('720 x 720');
      logInfo(`onSizeChange(width=720, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0126
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0126
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1080) yields "720 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0126 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1080);
      logInfo(`onSizeChange(width=720, height=1080): actual=${actual}`);
      expect(actual).assertEqual('720 x 1080');
      logInfo(`onSizeChange(width=720, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0127
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0127
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1920) yields "720 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0127 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1920);
      logInfo(`onSizeChange(width=720, height=1920): actual=${actual}`);
      expect(actual).assertEqual('720 x 1920');
      logInfo(`onSizeChange(width=720, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0128
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0128
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=-1) yields "720 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0128 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, -1);
      logInfo(`onSizeChange(width=720, height=-1): actual=${actual}`);
      expect(actual).assertEqual('720 x -1');
      logInfo(`onSizeChange(width=720, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0129
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0129
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=2) yields "720 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0129 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 2);
      logInfo(`onSizeChange(width=720, height=2): actual=${actual}`);
      expect(actual).assertEqual('720 x 2');
      logInfo(`onSizeChange(width=720, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0130
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0130
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=3) yields "720 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0130 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 3);
      logInfo(`onSizeChange(width=720, height=3): actual=${actual}`);
      expect(actual).assertEqual('720 x 3');
      logInfo(`onSizeChange(width=720, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0131
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0131
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=10) yields "720 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0131 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 10);
      logInfo(`onSizeChange(width=720, height=10): actual=${actual}`);
      expect(actual).assertEqual('720 x 10');
      logInfo(`onSizeChange(width=720, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0132
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0132
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=96) yields "720 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0132 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 96);
      logInfo(`onSizeChange(width=720, height=96): actual=${actual}`);
      expect(actual).assertEqual('720 x 96');
      logInfo(`onSizeChange(width=720, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0133
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0133
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=192) yields "720 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0133 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 192);
      logInfo(`onSizeChange(width=720, height=192): actual=${actual}`);
      expect(actual).assertEqual('720 x 192');
      logInfo(`onSizeChange(width=720, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0134
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0134
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=288) yields "720 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0134 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 288);
      logInfo(`onSizeChange(width=720, height=288): actual=${actual}`);
      expect(actual).assertEqual('720 x 288');
      logInfo(`onSizeChange(width=720, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0135
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0135
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=384) yields "720 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0135 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 384);
      logInfo(`onSizeChange(width=720, height=384): actual=${actual}`);
      expect(actual).assertEqual('720 x 384');
      logInfo(`onSizeChange(width=720, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0136
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0136
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=480) yields "720 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0136 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 480);
      logInfo(`onSizeChange(width=720, height=480): actual=${actual}`);
      expect(actual).assertEqual('720 x 480');
      logInfo(`onSizeChange(width=720, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0137
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0137
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=576) yields "720 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0137 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 576);
      logInfo(`onSizeChange(width=720, height=576): actual=${actual}`);
      expect(actual).assertEqual('720 x 576');
      logInfo(`onSizeChange(width=720, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0138
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0138
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=672) yields "720 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0138 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 672);
      logInfo(`onSizeChange(width=720, height=672): actual=${actual}`);
      expect(actual).assertEqual('720 x 672');
      logInfo(`onSizeChange(width=720, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0139
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0139
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=768) yields "720 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0139 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 768);
      logInfo(`onSizeChange(width=720, height=768): actual=${actual}`);
      expect(actual).assertEqual('720 x 768');
      logInfo(`onSizeChange(width=720, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0140
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0140
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=864) yields "720 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0140 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 864);
      logInfo(`onSizeChange(width=720, height=864): actual=${actual}`);
      expect(actual).assertEqual('720 x 864');
      logInfo(`onSizeChange(width=720, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0141
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0141
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=960) yields "720 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0141 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 960);
      logInfo(`onSizeChange(width=720, height=960): actual=${actual}`);
      expect(actual).assertEqual('720 x 960');
      logInfo(`onSizeChange(width=720, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0142
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0142
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1056) yields "720 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0142 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1056);
      logInfo(`onSizeChange(width=720, height=1056): actual=${actual}`);
      expect(actual).assertEqual('720 x 1056');
      logInfo(`onSizeChange(width=720, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0143
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0143
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1152) yields "720 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0143 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1152);
      logInfo(`onSizeChange(width=720, height=1152): actual=${actual}`);
      expect(actual).assertEqual('720 x 1152');
      logInfo(`onSizeChange(width=720, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0144
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0144
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1248) yields "720 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0144 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1248);
      logInfo(`onSizeChange(width=720, height=1248): actual=${actual}`);
      expect(actual).assertEqual('720 x 1248');
      logInfo(`onSizeChange(width=720, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0145
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0145
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1344) yields "720 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0145 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1344);
      logInfo(`onSizeChange(width=720, height=1344): actual=${actual}`);
      expect(actual).assertEqual('720 x 1344');
      logInfo(`onSizeChange(width=720, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0146
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0146
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1440) yields "720 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0146 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1440);
      logInfo(`onSizeChange(width=720, height=1440): actual=${actual}`);
      expect(actual).assertEqual('720 x 1440');
      logInfo(`onSizeChange(width=720, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0146 end`);
    });
  });
}
