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
export default function ratioPageStateOnSizeChange4Test(): void {
  describe('RatioPageStateOnSizeChange4Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0220
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0220
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=3) yields "-1 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0220 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 3);
      logInfo(`onSizeChange(width=-1, height=3): actual=${actual}`);
      expect(actual).assertEqual('-1 x 3');
      logInfo(`onSizeChange(width=-1, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0221
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0221
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=10) yields "-1 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0221 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 10);
      logInfo(`onSizeChange(width=-1, height=10): actual=${actual}`);
      expect(actual).assertEqual('-1 x 10');
      logInfo(`onSizeChange(width=-1, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0222
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0222
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=96) yields "-1 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0222 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 96);
      logInfo(`onSizeChange(width=-1, height=96): actual=${actual}`);
      expect(actual).assertEqual('-1 x 96');
      logInfo(`onSizeChange(width=-1, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0223
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0223
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=192) yields "-1 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0223 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 192);
      logInfo(`onSizeChange(width=-1, height=192): actual=${actual}`);
      expect(actual).assertEqual('-1 x 192');
      logInfo(`onSizeChange(width=-1, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0224
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0224
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=288) yields "-1 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0224 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 288);
      logInfo(`onSizeChange(width=-1, height=288): actual=${actual}`);
      expect(actual).assertEqual('-1 x 288');
      logInfo(`onSizeChange(width=-1, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0225
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0225
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=384) yields "-1 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0225 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 384);
      logInfo(`onSizeChange(width=-1, height=384): actual=${actual}`);
      expect(actual).assertEqual('-1 x 384');
      logInfo(`onSizeChange(width=-1, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0226
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0226
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=480) yields "-1 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0226 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 480);
      logInfo(`onSizeChange(width=-1, height=480): actual=${actual}`);
      expect(actual).assertEqual('-1 x 480');
      logInfo(`onSizeChange(width=-1, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0227
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0227
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=576) yields "-1 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0227 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 576);
      logInfo(`onSizeChange(width=-1, height=576): actual=${actual}`);
      expect(actual).assertEqual('-1 x 576');
      logInfo(`onSizeChange(width=-1, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0228
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0228
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=672) yields "-1 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0228 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 672);
      logInfo(`onSizeChange(width=-1, height=672): actual=${actual}`);
      expect(actual).assertEqual('-1 x 672');
      logInfo(`onSizeChange(width=-1, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0229
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0229
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=768) yields "-1 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0229 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 768);
      logInfo(`onSizeChange(width=-1, height=768): actual=${actual}`);
      expect(actual).assertEqual('-1 x 768');
      logInfo(`onSizeChange(width=-1, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0230
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0230
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=864) yields "-1 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0230 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 864);
      logInfo(`onSizeChange(width=-1, height=864): actual=${actual}`);
      expect(actual).assertEqual('-1 x 864');
      logInfo(`onSizeChange(width=-1, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0231
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0231
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=960) yields "-1 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0231 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 960);
      logInfo(`onSizeChange(width=-1, height=960): actual=${actual}`);
      expect(actual).assertEqual('-1 x 960');
      logInfo(`onSizeChange(width=-1, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0232
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0232
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1056) yields "-1 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0232 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1056);
      logInfo(`onSizeChange(width=-1, height=1056): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1056');
      logInfo(`onSizeChange(width=-1, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0233
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0233
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1152) yields "-1 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0233 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1152);
      logInfo(`onSizeChange(width=-1, height=1152): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1152');
      logInfo(`onSizeChange(width=-1, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0234
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0234
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1248) yields "-1 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0234 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1248);
      logInfo(`onSizeChange(width=-1, height=1248): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1248');
      logInfo(`onSizeChange(width=-1, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0235
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0235
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1344) yields "-1 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0235 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1344);
      logInfo(`onSizeChange(width=-1, height=1344): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1344');
      logInfo(`onSizeChange(width=-1, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0236
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0236
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1440) yields "-1 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0236 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1440);
      logInfo(`onSizeChange(width=-1, height=1440): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1440');
      logInfo(`onSizeChange(width=-1, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0237
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0237
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1536) yields "-1 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0237 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1536);
      logInfo(`onSizeChange(width=-1, height=1536): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1536');
      logInfo(`onSizeChange(width=-1, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0238
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0238
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1632) yields "-1 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0238 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1632);
      logInfo(`onSizeChange(width=-1, height=1632): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1632');
      logInfo(`onSizeChange(width=-1, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0239
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0239
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1728) yields "-1 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0239 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1728);
      logInfo(`onSizeChange(width=-1, height=1728): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1728');
      logInfo(`onSizeChange(width=-1, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0240
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0240
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1824) yields "-1 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0240 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1824);
      logInfo(`onSizeChange(width=-1, height=1824): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1824');
      logInfo(`onSizeChange(width=-1, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0241
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0241
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=0) yields "2 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0241 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 0);
      logInfo(`onSizeChange(width=2, height=0): actual=${actual}`);
      expect(actual).assertEqual('2 x 0');
      logInfo(`onSizeChange(width=2, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0242
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0242
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1) yields "2 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0242 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1);
      logInfo(`onSizeChange(width=2, height=1): actual=${actual}`);
      expect(actual).assertEqual('2 x 1');
      logInfo(`onSizeChange(width=2, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0243
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0243
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=100) yields "2 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0243 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 100);
      logInfo(`onSizeChange(width=2, height=100): actual=${actual}`);
      expect(actual).assertEqual('2 x 100');
      logInfo(`onSizeChange(width=2, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0244
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0244
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=360) yields "2 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0244 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 360);
      logInfo(`onSizeChange(width=2, height=360): actual=${actual}`);
      expect(actual).assertEqual('2 x 360');
      logInfo(`onSizeChange(width=2, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0244 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0245
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0245
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=720) yields "2 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0245 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 720);
      logInfo(`onSizeChange(width=2, height=720): actual=${actual}`);
      expect(actual).assertEqual('2 x 720');
      logInfo(`onSizeChange(width=2, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0245 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0246
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0246
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1080) yields "2 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0246 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1080);
      logInfo(`onSizeChange(width=2, height=1080): actual=${actual}`);
      expect(actual).assertEqual('2 x 1080');
      logInfo(`onSizeChange(width=2, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0246 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0247
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0247
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1920) yields "2 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0247 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1920);
      logInfo(`onSizeChange(width=2, height=1920): actual=${actual}`);
      expect(actual).assertEqual('2 x 1920');
      logInfo(`onSizeChange(width=2, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0247 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0248
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0248
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=-1) yields "2 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0248 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, -1);
      logInfo(`onSizeChange(width=2, height=-1): actual=${actual}`);
      expect(actual).assertEqual('2 x -1');
      logInfo(`onSizeChange(width=2, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0248 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0249
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0249
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=2) yields "2 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0249 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 2);
      logInfo(`onSizeChange(width=2, height=2): actual=${actual}`);
      expect(actual).assertEqual('2 x 2');
      logInfo(`onSizeChange(width=2, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0249 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0250
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0250
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=3) yields "2 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0250 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 3);
      logInfo(`onSizeChange(width=2, height=3): actual=${actual}`);
      expect(actual).assertEqual('2 x 3');
      logInfo(`onSizeChange(width=2, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0250 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0251
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0251
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=10) yields "2 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0251 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 10);
      logInfo(`onSizeChange(width=2, height=10): actual=${actual}`);
      expect(actual).assertEqual('2 x 10');
      logInfo(`onSizeChange(width=2, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0251 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0252
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0252
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=96) yields "2 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0252 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 96);
      logInfo(`onSizeChange(width=2, height=96): actual=${actual}`);
      expect(actual).assertEqual('2 x 96');
      logInfo(`onSizeChange(width=2, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0252 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0253
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0253
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=192) yields "2 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0253 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 192);
      logInfo(`onSizeChange(width=2, height=192): actual=${actual}`);
      expect(actual).assertEqual('2 x 192');
      logInfo(`onSizeChange(width=2, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0253 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0254
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0254
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=288) yields "2 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0254 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 288);
      logInfo(`onSizeChange(width=2, height=288): actual=${actual}`);
      expect(actual).assertEqual('2 x 288');
      logInfo(`onSizeChange(width=2, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0254 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0255
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0255
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=384) yields "2 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0255 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 384);
      logInfo(`onSizeChange(width=2, height=384): actual=${actual}`);
      expect(actual).assertEqual('2 x 384');
      logInfo(`onSizeChange(width=2, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0255 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0256
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0256
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=480) yields "2 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0256 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 480);
      logInfo(`onSizeChange(width=2, height=480): actual=${actual}`);
      expect(actual).assertEqual('2 x 480');
      logInfo(`onSizeChange(width=2, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0256 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0257
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0257
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=576) yields "2 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0257 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 576);
      logInfo(`onSizeChange(width=2, height=576): actual=${actual}`);
      expect(actual).assertEqual('2 x 576');
      logInfo(`onSizeChange(width=2, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0257 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0258
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0258
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=672) yields "2 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0258 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 672);
      logInfo(`onSizeChange(width=2, height=672): actual=${actual}`);
      expect(actual).assertEqual('2 x 672');
      logInfo(`onSizeChange(width=2, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0258 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0259
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0259
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=768) yields "2 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0259 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 768);
      logInfo(`onSizeChange(width=2, height=768): actual=${actual}`);
      expect(actual).assertEqual('2 x 768');
      logInfo(`onSizeChange(width=2, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0259 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0260
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0260
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=864) yields "2 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0260 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 864);
      logInfo(`onSizeChange(width=2, height=864): actual=${actual}`);
      expect(actual).assertEqual('2 x 864');
      logInfo(`onSizeChange(width=2, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0260 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0261
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0261
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=960) yields "2 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0261 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 960);
      logInfo(`onSizeChange(width=2, height=960): actual=${actual}`);
      expect(actual).assertEqual('2 x 960');
      logInfo(`onSizeChange(width=2, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0261 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0262
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0262
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1056) yields "2 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0262 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1056);
      logInfo(`onSizeChange(width=2, height=1056): actual=${actual}`);
      expect(actual).assertEqual('2 x 1056');
      logInfo(`onSizeChange(width=2, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0262 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0263
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0263
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1152) yields "2 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0263 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1152);
      logInfo(`onSizeChange(width=2, height=1152): actual=${actual}`);
      expect(actual).assertEqual('2 x 1152');
      logInfo(`onSizeChange(width=2, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0263 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0264
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0264
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1248) yields "2 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0264 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1248);
      logInfo(`onSizeChange(width=2, height=1248): actual=${actual}`);
      expect(actual).assertEqual('2 x 1248');
      logInfo(`onSizeChange(width=2, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0264 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0265
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0265
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1344) yields "2 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0265 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1344);
      logInfo(`onSizeChange(width=2, height=1344): actual=${actual}`);
      expect(actual).assertEqual('2 x 1344');
      logInfo(`onSizeChange(width=2, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0265 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0266
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0266
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1440) yields "2 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0266 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1440);
      logInfo(`onSizeChange(width=2, height=1440): actual=${actual}`);
      expect(actual).assertEqual('2 x 1440');
      logInfo(`onSizeChange(width=2, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0266 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0267
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0267
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1536) yields "2 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0267 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1536);
      logInfo(`onSizeChange(width=2, height=1536): actual=${actual}`);
      expect(actual).assertEqual('2 x 1536');
      logInfo(`onSizeChange(width=2, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0267 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0268
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0268
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1632) yields "2 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0268 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1632);
      logInfo(`onSizeChange(width=2, height=1632): actual=${actual}`);
      expect(actual).assertEqual('2 x 1632');
      logInfo(`onSizeChange(width=2, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0268 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0269
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0269
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1728) yields "2 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0269 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1728);
      logInfo(`onSizeChange(width=2, height=1728): actual=${actual}`);
      expect(actual).assertEqual('2 x 1728');
      logInfo(`onSizeChange(width=2, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0269 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0270
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0270
     * @tc.desc      RatioPageState.onSizeChange(width=2, height=1824) yields "2 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0270 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(2, 1824);
      logInfo(`onSizeChange(width=2, height=1824): actual=${actual}`);
      expect(actual).assertEqual('2 x 1824');
      logInfo(`onSizeChange(width=2, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange(width=2, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0270 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0271
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0271
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=0) yields "3 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0271 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 0);
      logInfo(`onSizeChange(width=3, height=0): actual=${actual}`);
      expect(actual).assertEqual('3 x 0');
      logInfo(`onSizeChange(width=3, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0271 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0272
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0272
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1) yields "3 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0272 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1);
      logInfo(`onSizeChange(width=3, height=1): actual=${actual}`);
      expect(actual).assertEqual('3 x 1');
      logInfo(`onSizeChange(width=3, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0272 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0273
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0273
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=100) yields "3 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0273 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 100);
      logInfo(`onSizeChange(width=3, height=100): actual=${actual}`);
      expect(actual).assertEqual('3 x 100');
      logInfo(`onSizeChange(width=3, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0273 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0274
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0274
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=360) yields "3 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0274 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 360);
      logInfo(`onSizeChange(width=3, height=360): actual=${actual}`);
      expect(actual).assertEqual('3 x 360');
      logInfo(`onSizeChange(width=3, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0274 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0275
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0275
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=720) yields "3 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0275 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 720);
      logInfo(`onSizeChange(width=3, height=720): actual=${actual}`);
      expect(actual).assertEqual('3 x 720');
      logInfo(`onSizeChange(width=3, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0275 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0276
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0276
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1080) yields "3 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0276 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1080);
      logInfo(`onSizeChange(width=3, height=1080): actual=${actual}`);
      expect(actual).assertEqual('3 x 1080');
      logInfo(`onSizeChange(width=3, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0276 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0277
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0277
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1920) yields "3 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0277 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1920);
      logInfo(`onSizeChange(width=3, height=1920): actual=${actual}`);
      expect(actual).assertEqual('3 x 1920');
      logInfo(`onSizeChange(width=3, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0277 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0278
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0278
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=-1) yields "3 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0278 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, -1);
      logInfo(`onSizeChange(width=3, height=-1): actual=${actual}`);
      expect(actual).assertEqual('3 x -1');
      logInfo(`onSizeChange(width=3, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0278 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0279
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0279
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=2) yields "3 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0279 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 2);
      logInfo(`onSizeChange(width=3, height=2): actual=${actual}`);
      expect(actual).assertEqual('3 x 2');
      logInfo(`onSizeChange(width=3, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0279 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0280
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0280
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=3) yields "3 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0280 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 3);
      logInfo(`onSizeChange(width=3, height=3): actual=${actual}`);
      expect(actual).assertEqual('3 x 3');
      logInfo(`onSizeChange(width=3, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0280 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0281
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0281
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=10) yields "3 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0281 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 10);
      logInfo(`onSizeChange(width=3, height=10): actual=${actual}`);
      expect(actual).assertEqual('3 x 10');
      logInfo(`onSizeChange(width=3, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0281 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0282
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0282
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=96) yields "3 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0282 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 96);
      logInfo(`onSizeChange(width=3, height=96): actual=${actual}`);
      expect(actual).assertEqual('3 x 96');
      logInfo(`onSizeChange(width=3, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0282 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0283
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0283
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=192) yields "3 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0283 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 192);
      logInfo(`onSizeChange(width=3, height=192): actual=${actual}`);
      expect(actual).assertEqual('3 x 192');
      logInfo(`onSizeChange(width=3, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0283 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0284
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0284
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=288) yields "3 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0284 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 288);
      logInfo(`onSizeChange(width=3, height=288): actual=${actual}`);
      expect(actual).assertEqual('3 x 288');
      logInfo(`onSizeChange(width=3, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0284 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0285
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0285
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=384) yields "3 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0285 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 384);
      logInfo(`onSizeChange(width=3, height=384): actual=${actual}`);
      expect(actual).assertEqual('3 x 384');
      logInfo(`onSizeChange(width=3, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0285 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0286
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0286
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=480) yields "3 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0286 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 480);
      logInfo(`onSizeChange(width=3, height=480): actual=${actual}`);
      expect(actual).assertEqual('3 x 480');
      logInfo(`onSizeChange(width=3, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0286 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0287
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0287
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=576) yields "3 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0287 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 576);
      logInfo(`onSizeChange(width=3, height=576): actual=${actual}`);
      expect(actual).assertEqual('3 x 576');
      logInfo(`onSizeChange(width=3, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0287 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0288
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0288
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=672) yields "3 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0288 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 672);
      logInfo(`onSizeChange(width=3, height=672): actual=${actual}`);
      expect(actual).assertEqual('3 x 672');
      logInfo(`onSizeChange(width=3, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0288 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0289
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0289
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=768) yields "3 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0289 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 768);
      logInfo(`onSizeChange(width=3, height=768): actual=${actual}`);
      expect(actual).assertEqual('3 x 768');
      logInfo(`onSizeChange(width=3, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0289 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0290
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0290
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=864) yields "3 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0290 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 864);
      logInfo(`onSizeChange(width=3, height=864): actual=${actual}`);
      expect(actual).assertEqual('3 x 864');
      logInfo(`onSizeChange(width=3, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0290 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0291
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0291
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=960) yields "3 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0291 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 960);
      logInfo(`onSizeChange(width=3, height=960): actual=${actual}`);
      expect(actual).assertEqual('3 x 960');
      logInfo(`onSizeChange(width=3, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0291 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0292
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0292
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1056) yields "3 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0292 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1056);
      logInfo(`onSizeChange(width=3, height=1056): actual=${actual}`);
      expect(actual).assertEqual('3 x 1056');
      logInfo(`onSizeChange(width=3, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0292 end`);
    });
  });
}
