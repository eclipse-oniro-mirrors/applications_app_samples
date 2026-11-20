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

/** Logic checks for RatioPageState.onSizeChange (22 cases). */
export default function ratioPageStateOnSizeChange5Test(): void {
  describe('RatioPageStateOnSizeChange5Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0293
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0293
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1152) yields "3 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0293 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1152);
      logInfo(`onSizeChange(width=3, height=1152): actual=${actual}`);
      expect(actual).assertEqual('3 x 1152');
      logInfo(`onSizeChange(width=3, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0293 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0294
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0294
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1248) yields "3 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0294 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1248);
      logInfo(`onSizeChange(width=3, height=1248): actual=${actual}`);
      expect(actual).assertEqual('3 x 1248');
      logInfo(`onSizeChange(width=3, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0294 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0295
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0295
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1344) yields "3 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0295 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1344);
      logInfo(`onSizeChange(width=3, height=1344): actual=${actual}`);
      expect(actual).assertEqual('3 x 1344');
      logInfo(`onSizeChange(width=3, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0295 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0296
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0296
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1440) yields "3 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0296 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1440);
      logInfo(`onSizeChange(width=3, height=1440): actual=${actual}`);
      expect(actual).assertEqual('3 x 1440');
      logInfo(`onSizeChange(width=3, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0296 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0297
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0297
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1536) yields "3 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0297 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1536);
      logInfo(`onSizeChange(width=3, height=1536): actual=${actual}`);
      expect(actual).assertEqual('3 x 1536');
      logInfo(`onSizeChange(width=3, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0297 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0298
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0298
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1632) yields "3 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0298 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1632);
      logInfo(`onSizeChange(width=3, height=1632): actual=${actual}`);
      expect(actual).assertEqual('3 x 1632');
      logInfo(`onSizeChange(width=3, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0298 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0299
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0299
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1728) yields "3 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0299 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1728);
      logInfo(`onSizeChange(width=3, height=1728): actual=${actual}`);
      expect(actual).assertEqual('3 x 1728');
      logInfo(`onSizeChange(width=3, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0299 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0300
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0300
     * @tc.desc      RatioPageState.onSizeChange(width=3, height=1824) yields "3 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0300 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(3, 1824);
      logInfo(`onSizeChange(width=3, height=1824): actual=${actual}`);
      expect(actual).assertEqual('3 x 1824');
      logInfo(`onSizeChange(width=3, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange(width=3, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0300 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0301
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0301
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=0) yields "10 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0301 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 0);
      logInfo(`onSizeChange(width=10, height=0): actual=${actual}`);
      expect(actual).assertEqual('10 x 0');
      logInfo(`onSizeChange(width=10, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0301 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0302
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0302
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=1) yields "10 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0302 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 1);
      logInfo(`onSizeChange(width=10, height=1): actual=${actual}`);
      expect(actual).assertEqual('10 x 1');
      logInfo(`onSizeChange(width=10, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0302 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0303
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0303
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=100) yields "10 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0303 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 100);
      logInfo(`onSizeChange(width=10, height=100): actual=${actual}`);
      expect(actual).assertEqual('10 x 100');
      logInfo(`onSizeChange(width=10, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0303 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0304
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0304
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=360) yields "10 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0304 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 360);
      logInfo(`onSizeChange(width=10, height=360): actual=${actual}`);
      expect(actual).assertEqual('10 x 360');
      logInfo(`onSizeChange(width=10, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0304 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0305
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0305
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=720) yields "10 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0305 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 720);
      logInfo(`onSizeChange(width=10, height=720): actual=${actual}`);
      expect(actual).assertEqual('10 x 720');
      logInfo(`onSizeChange(width=10, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0305 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0306
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0306
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=1080) yields "10 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0306 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 1080);
      logInfo(`onSizeChange(width=10, height=1080): actual=${actual}`);
      expect(actual).assertEqual('10 x 1080');
      logInfo(`onSizeChange(width=10, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0306 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0307
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0307
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=1920) yields "10 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0307 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 1920);
      logInfo(`onSizeChange(width=10, height=1920): actual=${actual}`);
      expect(actual).assertEqual('10 x 1920');
      logInfo(`onSizeChange(width=10, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0307 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0308
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0308
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=-1) yields "10 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0308 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, -1);
      logInfo(`onSizeChange(width=10, height=-1): actual=${actual}`);
      expect(actual).assertEqual('10 x -1');
      logInfo(`onSizeChange(width=10, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0308 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0309
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0309
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=2) yields "10 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0309 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 2);
      logInfo(`onSizeChange(width=10, height=2): actual=${actual}`);
      expect(actual).assertEqual('10 x 2');
      logInfo(`onSizeChange(width=10, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0309 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0310
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0310
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=3) yields "10 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0310 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 3);
      logInfo(`onSizeChange(width=10, height=3): actual=${actual}`);
      expect(actual).assertEqual('10 x 3');
      logInfo(`onSizeChange(width=10, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0310 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0311
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0311
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=10) yields "10 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0311 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 10);
      logInfo(`onSizeChange(width=10, height=10): actual=${actual}`);
      expect(actual).assertEqual('10 x 10');
      logInfo(`onSizeChange(width=10, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0311 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0312
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0312
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=96) yields "10 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0312 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 96);
      logInfo(`onSizeChange(width=10, height=96): actual=${actual}`);
      expect(actual).assertEqual('10 x 96');
      logInfo(`onSizeChange(width=10, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0313
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0313
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=192) yields "10 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0313 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 192);
      logInfo(`onSizeChange(width=10, height=192): actual=${actual}`);
      expect(actual).assertEqual('10 x 192');
      logInfo(`onSizeChange(width=10, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0314
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0314
     * @tc.desc      RatioPageState.onSizeChange(width=10, height=288) yields "10 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0314 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(10, 288);
      logInfo(`onSizeChange(width=10, height=288): actual=${actual}`);
      expect(actual).assertEqual('10 x 288');
      logInfo(`onSizeChange(width=10, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange(width=10, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0314 end`);
    });
  });
}
