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
export default function ratioPageStateOnSizeChange3Test(): void {
  describe('RatioPageStateOnSizeChange3Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0147
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0147
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1536) yields "720 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0147 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1536);
      logInfo(`onSizeChange(width=720, height=1536): actual=${actual}`);
      expect(actual).assertEqual('720 x 1536');
      logInfo(`onSizeChange(width=720, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0148
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0148
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1632) yields "720 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0148 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1632);
      logInfo(`onSizeChange(width=720, height=1632): actual=${actual}`);
      expect(actual).assertEqual('720 x 1632');
      logInfo(`onSizeChange(width=720, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0149
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0149
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1728) yields "720 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0149 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1728);
      logInfo(`onSizeChange(width=720, height=1728): actual=${actual}`);
      expect(actual).assertEqual('720 x 1728');
      logInfo(`onSizeChange(width=720, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0150
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0150
     * @tc.desc      RatioPageState.onSizeChange(width=720, height=1824) yields "720 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0150 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(720, 1824);
      logInfo(`onSizeChange(width=720, height=1824): actual=${actual}`);
      expect(actual).assertEqual('720 x 1824');
      logInfo(`onSizeChange(width=720, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange(width=720, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0151
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0151
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=0) yields "1080 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0151 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 0);
      logInfo(`onSizeChange(width=1080, height=0): actual=${actual}`);
      expect(actual).assertEqual('1080 x 0');
      logInfo(`onSizeChange(width=1080, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0152
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0152
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1) yields "1080 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0152 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1);
      logInfo(`onSizeChange(width=1080, height=1): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1');
      logInfo(`onSizeChange(width=1080, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0153
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0153
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=100) yields "1080 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0153 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 100);
      logInfo(`onSizeChange(width=1080, height=100): actual=${actual}`);
      expect(actual).assertEqual('1080 x 100');
      logInfo(`onSizeChange(width=1080, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0154
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0154
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=360) yields "1080 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0154 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 360);
      logInfo(`onSizeChange(width=1080, height=360): actual=${actual}`);
      expect(actual).assertEqual('1080 x 360');
      logInfo(`onSizeChange(width=1080, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0155
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0155
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=720) yields "1080 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0155 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 720);
      logInfo(`onSizeChange(width=1080, height=720): actual=${actual}`);
      expect(actual).assertEqual('1080 x 720');
      logInfo(`onSizeChange(width=1080, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0156
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0156
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1080) yields "1080 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0156 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1080);
      logInfo(`onSizeChange(width=1080, height=1080): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1080');
      logInfo(`onSizeChange(width=1080, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0157
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0157
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1920) yields "1080 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0157 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1920);
      logInfo(`onSizeChange(width=1080, height=1920): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1920');
      logInfo(`onSizeChange(width=1080, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0158
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0158
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=-1) yields "1080 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0158 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, -1);
      logInfo(`onSizeChange(width=1080, height=-1): actual=${actual}`);
      expect(actual).assertEqual('1080 x -1');
      logInfo(`onSizeChange(width=1080, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0159
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0159
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=2) yields "1080 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0159 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 2);
      logInfo(`onSizeChange(width=1080, height=2): actual=${actual}`);
      expect(actual).assertEqual('1080 x 2');
      logInfo(`onSizeChange(width=1080, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0160
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0160
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=3) yields "1080 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0160 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 3);
      logInfo(`onSizeChange(width=1080, height=3): actual=${actual}`);
      expect(actual).assertEqual('1080 x 3');
      logInfo(`onSizeChange(width=1080, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0161
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0161
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=10) yields "1080 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0161 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 10);
      logInfo(`onSizeChange(width=1080, height=10): actual=${actual}`);
      expect(actual).assertEqual('1080 x 10');
      logInfo(`onSizeChange(width=1080, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0162
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0162
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=96) yields "1080 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0162 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 96);
      logInfo(`onSizeChange(width=1080, height=96): actual=${actual}`);
      expect(actual).assertEqual('1080 x 96');
      logInfo(`onSizeChange(width=1080, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0163
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0163
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=192) yields "1080 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0163 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 192);
      logInfo(`onSizeChange(width=1080, height=192): actual=${actual}`);
      expect(actual).assertEqual('1080 x 192');
      logInfo(`onSizeChange(width=1080, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0164
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0164
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=288) yields "1080 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0164 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 288);
      logInfo(`onSizeChange(width=1080, height=288): actual=${actual}`);
      expect(actual).assertEqual('1080 x 288');
      logInfo(`onSizeChange(width=1080, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0165
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0165
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=384) yields "1080 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0165 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 384);
      logInfo(`onSizeChange(width=1080, height=384): actual=${actual}`);
      expect(actual).assertEqual('1080 x 384');
      logInfo(`onSizeChange(width=1080, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0166
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0166
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=480) yields "1080 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0166 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 480);
      logInfo(`onSizeChange(width=1080, height=480): actual=${actual}`);
      expect(actual).assertEqual('1080 x 480');
      logInfo(`onSizeChange(width=1080, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0167
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0167
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=576) yields "1080 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0167 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 576);
      logInfo(`onSizeChange(width=1080, height=576): actual=${actual}`);
      expect(actual).assertEqual('1080 x 576');
      logInfo(`onSizeChange(width=1080, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0168
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0168
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=672) yields "1080 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0168 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 672);
      logInfo(`onSizeChange(width=1080, height=672): actual=${actual}`);
      expect(actual).assertEqual('1080 x 672');
      logInfo(`onSizeChange(width=1080, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0169
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0169
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=768) yields "1080 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0169 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 768);
      logInfo(`onSizeChange(width=1080, height=768): actual=${actual}`);
      expect(actual).assertEqual('1080 x 768');
      logInfo(`onSizeChange(width=1080, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0170
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0170
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=864) yields "1080 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0170 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 864);
      logInfo(`onSizeChange(width=1080, height=864): actual=${actual}`);
      expect(actual).assertEqual('1080 x 864');
      logInfo(`onSizeChange(width=1080, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0171
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0171
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=960) yields "1080 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0171 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 960);
      logInfo(`onSizeChange(width=1080, height=960): actual=${actual}`);
      expect(actual).assertEqual('1080 x 960');
      logInfo(`onSizeChange(width=1080, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0172
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0172
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1056) yields "1080 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0172 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1056);
      logInfo(`onSizeChange(width=1080, height=1056): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1056');
      logInfo(`onSizeChange(width=1080, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0173
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0173
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1152) yields "1080 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0173 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1152);
      logInfo(`onSizeChange(width=1080, height=1152): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1152');
      logInfo(`onSizeChange(width=1080, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0174
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0174
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1248) yields "1080 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0174 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1248);
      logInfo(`onSizeChange(width=1080, height=1248): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1248');
      logInfo(`onSizeChange(width=1080, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0175
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0175
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1344) yields "1080 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0175 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1344);
      logInfo(`onSizeChange(width=1080, height=1344): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1344');
      logInfo(`onSizeChange(width=1080, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0176
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0176
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1440) yields "1080 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0176 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1440);
      logInfo(`onSizeChange(width=1080, height=1440): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1440');
      logInfo(`onSizeChange(width=1080, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0177
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0177
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1536) yields "1080 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0177 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1536);
      logInfo(`onSizeChange(width=1080, height=1536): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1536');
      logInfo(`onSizeChange(width=1080, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0178
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0178
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1632) yields "1080 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0178 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1632);
      logInfo(`onSizeChange(width=1080, height=1632): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1632');
      logInfo(`onSizeChange(width=1080, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0179
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0179
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1728) yields "1080 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0179 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1728);
      logInfo(`onSizeChange(width=1080, height=1728): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1728');
      logInfo(`onSizeChange(width=1080, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0180
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0180
     * @tc.desc      RatioPageState.onSizeChange(width=1080, height=1824) yields "1080 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0180 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1080, 1824);
      logInfo(`onSizeChange(width=1080, height=1824): actual=${actual}`);
      expect(actual).assertEqual('1080 x 1824');
      logInfo(`onSizeChange(width=1080, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange(width=1080, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0181
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0181
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=0) yields "1920 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0181 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 0);
      logInfo(`onSizeChange(width=1920, height=0): actual=${actual}`);
      expect(actual).assertEqual('1920 x 0');
      logInfo(`onSizeChange(width=1920, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0182
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0182
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1) yields "1920 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0182 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1);
      logInfo(`onSizeChange(width=1920, height=1): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1');
      logInfo(`onSizeChange(width=1920, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0183
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0183
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=100) yields "1920 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0183 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 100);
      logInfo(`onSizeChange(width=1920, height=100): actual=${actual}`);
      expect(actual).assertEqual('1920 x 100');
      logInfo(`onSizeChange(width=1920, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0184
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0184
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=360) yields "1920 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0184 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 360);
      logInfo(`onSizeChange(width=1920, height=360): actual=${actual}`);
      expect(actual).assertEqual('1920 x 360');
      logInfo(`onSizeChange(width=1920, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0185
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0185
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=720) yields "1920 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0185 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 720);
      logInfo(`onSizeChange(width=1920, height=720): actual=${actual}`);
      expect(actual).assertEqual('1920 x 720');
      logInfo(`onSizeChange(width=1920, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0186
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0186
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1080) yields "1920 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0186 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1080);
      logInfo(`onSizeChange(width=1920, height=1080): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1080');
      logInfo(`onSizeChange(width=1920, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0187
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0187
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1920) yields "1920 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0187 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1920);
      logInfo(`onSizeChange(width=1920, height=1920): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1920');
      logInfo(`onSizeChange(width=1920, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0188
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0188
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=-1) yields "1920 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0188 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, -1);
      logInfo(`onSizeChange(width=1920, height=-1): actual=${actual}`);
      expect(actual).assertEqual('1920 x -1');
      logInfo(`onSizeChange(width=1920, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0189
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0189
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=2) yields "1920 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0189 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 2);
      logInfo(`onSizeChange(width=1920, height=2): actual=${actual}`);
      expect(actual).assertEqual('1920 x 2');
      logInfo(`onSizeChange(width=1920, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0190
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0190
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=3) yields "1920 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0190 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 3);
      logInfo(`onSizeChange(width=1920, height=3): actual=${actual}`);
      expect(actual).assertEqual('1920 x 3');
      logInfo(`onSizeChange(width=1920, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0191
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0191
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=10) yields "1920 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0191 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 10);
      logInfo(`onSizeChange(width=1920, height=10): actual=${actual}`);
      expect(actual).assertEqual('1920 x 10');
      logInfo(`onSizeChange(width=1920, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0192
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0192
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=96) yields "1920 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0192 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 96);
      logInfo(`onSizeChange(width=1920, height=96): actual=${actual}`);
      expect(actual).assertEqual('1920 x 96');
      logInfo(`onSizeChange(width=1920, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0192 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0193
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0193
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=192) yields "1920 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0193 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 192);
      logInfo(`onSizeChange(width=1920, height=192): actual=${actual}`);
      expect(actual).assertEqual('1920 x 192');
      logInfo(`onSizeChange(width=1920, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0194
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0194
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=288) yields "1920 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0194 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 288);
      logInfo(`onSizeChange(width=1920, height=288): actual=${actual}`);
      expect(actual).assertEqual('1920 x 288');
      logInfo(`onSizeChange(width=1920, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0195
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0195
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=384) yields "1920 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0195 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 384);
      logInfo(`onSizeChange(width=1920, height=384): actual=${actual}`);
      expect(actual).assertEqual('1920 x 384');
      logInfo(`onSizeChange(width=1920, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0196
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0196
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=480) yields "1920 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0196 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 480);
      logInfo(`onSizeChange(width=1920, height=480): actual=${actual}`);
      expect(actual).assertEqual('1920 x 480');
      logInfo(`onSizeChange(width=1920, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0197
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0197
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=576) yields "1920 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0197 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 576);
      logInfo(`onSizeChange(width=1920, height=576): actual=${actual}`);
      expect(actual).assertEqual('1920 x 576');
      logInfo(`onSizeChange(width=1920, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0198
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0198
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=672) yields "1920 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0198 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 672);
      logInfo(`onSizeChange(width=1920, height=672): actual=${actual}`);
      expect(actual).assertEqual('1920 x 672');
      logInfo(`onSizeChange(width=1920, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0199
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0199
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=768) yields "1920 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0199 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 768);
      logInfo(`onSizeChange(width=1920, height=768): actual=${actual}`);
      expect(actual).assertEqual('1920 x 768');
      logInfo(`onSizeChange(width=1920, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0200
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0200
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=864) yields "1920 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0200 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 864);
      logInfo(`onSizeChange(width=1920, height=864): actual=${actual}`);
      expect(actual).assertEqual('1920 x 864');
      logInfo(`onSizeChange(width=1920, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0201
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0201
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=960) yields "1920 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0201 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 960);
      logInfo(`onSizeChange(width=1920, height=960): actual=${actual}`);
      expect(actual).assertEqual('1920 x 960');
      logInfo(`onSizeChange(width=1920, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0202
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0202
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1056) yields "1920 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0202 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1056);
      logInfo(`onSizeChange(width=1920, height=1056): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1056');
      logInfo(`onSizeChange(width=1920, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0203
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0203
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1152) yields "1920 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0203 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1152);
      logInfo(`onSizeChange(width=1920, height=1152): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1152');
      logInfo(`onSizeChange(width=1920, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0204
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0204
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1248) yields "1920 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0204 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1248);
      logInfo(`onSizeChange(width=1920, height=1248): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1248');
      logInfo(`onSizeChange(width=1920, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0205
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0205
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1344) yields "1920 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0205 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1344);
      logInfo(`onSizeChange(width=1920, height=1344): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1344');
      logInfo(`onSizeChange(width=1920, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0206
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0206
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1440) yields "1920 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0206 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1440);
      logInfo(`onSizeChange(width=1920, height=1440): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1440');
      logInfo(`onSizeChange(width=1920, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0207
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0207
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1536) yields "1920 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0207 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1536);
      logInfo(`onSizeChange(width=1920, height=1536): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1536');
      logInfo(`onSizeChange(width=1920, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0208
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0208
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1632) yields "1920 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0208 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1632);
      logInfo(`onSizeChange(width=1920, height=1632): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1632');
      logInfo(`onSizeChange(width=1920, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0209
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0209
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1728) yields "1920 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0209 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1728);
      logInfo(`onSizeChange(width=1920, height=1728): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1728');
      logInfo(`onSizeChange(width=1920, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0210
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0210
     * @tc.desc      RatioPageState.onSizeChange(width=1920, height=1824) yields "1920 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0210 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1920, 1824);
      logInfo(`onSizeChange(width=1920, height=1824): actual=${actual}`);
      expect(actual).assertEqual('1920 x 1824');
      logInfo(`onSizeChange(width=1920, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange(width=1920, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0211
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0211
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=0) yields "-1 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0211 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 0);
      logInfo(`onSizeChange(width=-1, height=0): actual=${actual}`);
      expect(actual).assertEqual('-1 x 0');
      logInfo(`onSizeChange(width=-1, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0212
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0212
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1) yields "-1 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0212 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1);
      logInfo(`onSizeChange(width=-1, height=1): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1');
      logInfo(`onSizeChange(width=-1, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0213
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0213
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=100) yields "-1 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0213 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 100);
      logInfo(`onSizeChange(width=-1, height=100): actual=${actual}`);
      expect(actual).assertEqual('-1 x 100');
      logInfo(`onSizeChange(width=-1, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0214
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0214
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=360) yields "-1 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0214 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 360);
      logInfo(`onSizeChange(width=-1, height=360): actual=${actual}`);
      expect(actual).assertEqual('-1 x 360');
      logInfo(`onSizeChange(width=-1, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0215
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0215
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=720) yields "-1 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0215 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 720);
      logInfo(`onSizeChange(width=-1, height=720): actual=${actual}`);
      expect(actual).assertEqual('-1 x 720');
      logInfo(`onSizeChange(width=-1, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0216
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0216
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1080) yields "-1 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0216 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1080);
      logInfo(`onSizeChange(width=-1, height=1080): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1080');
      logInfo(`onSizeChange(width=-1, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0217
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0217
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=1920) yields "-1 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0217 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 1920);
      logInfo(`onSizeChange(width=-1, height=1920): actual=${actual}`);
      expect(actual).assertEqual('-1 x 1920');
      logInfo(`onSizeChange(width=-1, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0218
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0218
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=-1) yields "-1 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0218 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, -1);
      logInfo(`onSizeChange(width=-1, height=-1): actual=${actual}`);
      expect(actual).assertEqual('-1 x -1');
      logInfo(`onSizeChange(width=-1, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0219
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0219
     * @tc.desc      RatioPageState.onSizeChange(width=-1, height=2) yields "-1 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0219 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(-1, 2);
      logInfo(`onSizeChange(width=-1, height=2): actual=${actual}`);
      expect(actual).assertEqual('-1 x 2');
      logInfo(`onSizeChange(width=-1, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`onSizeChange(width=-1, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0219 end`);
    });
  });
}
