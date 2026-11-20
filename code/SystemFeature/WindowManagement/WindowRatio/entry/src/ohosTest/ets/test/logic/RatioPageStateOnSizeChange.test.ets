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
export default function ratioPageStateOnSizeChangeTest(): void {
  describe('RatioPageStateOnSizeChangeTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0001
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0001
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=0) yields "0 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0001 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 0);
      logInfo(`onSizeChange(width=0, height=0): actual=${actual}`);
      expect(actual).assertEqual('0 x 0');
      logInfo(`onSizeChange(width=0, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0002
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0002
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1) yields "0 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0002 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1);
      logInfo(`onSizeChange(width=0, height=1): actual=${actual}`);
      expect(actual).assertEqual('0 x 1');
      logInfo(`onSizeChange(width=0, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0003
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0003
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=100) yields "0 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0003 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 100);
      logInfo(`onSizeChange(width=0, height=100): actual=${actual}`);
      expect(actual).assertEqual('0 x 100');
      logInfo(`onSizeChange(width=0, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0004
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0004
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=360) yields "0 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0004 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 360);
      logInfo(`onSizeChange(width=0, height=360): actual=${actual}`);
      expect(actual).assertEqual('0 x 360');
      logInfo(`onSizeChange(width=0, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0005
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0005
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=720) yields "0 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0005 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 720);
      logInfo(`onSizeChange(width=0, height=720): actual=${actual}`);
      expect(actual).assertEqual('0 x 720');
      logInfo(`onSizeChange(width=0, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0006
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0006
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1080) yields "0 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0006 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1080);
      logInfo(`onSizeChange(width=0, height=1080): actual=${actual}`);
      expect(actual).assertEqual('0 x 1080');
      logInfo(`onSizeChange(width=0, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0007
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0007
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1920) yields "0 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0007 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1920);
      logInfo(`onSizeChange(width=0, height=1920): actual=${actual}`);
      expect(actual).assertEqual('0 x 1920');
      logInfo(`onSizeChange(width=0, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0008
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0008
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=-1) yields "0 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0008 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, -1);
      logInfo(`onSizeChange(width=0, height=-1): actual=${actual}`);
      expect(actual).assertEqual('0 x -1');
      logInfo(`onSizeChange(width=0, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0009
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0009
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=2) yields "0 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0009 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 2);
      logInfo(`onSizeChange(width=0, height=2): actual=${actual}`);
      expect(actual).assertEqual('0 x 2');
      logInfo(`onSizeChange(width=0, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0010
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0010
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=3) yields "0 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0010 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 3);
      logInfo(`onSizeChange(width=0, height=3): actual=${actual}`);
      expect(actual).assertEqual('0 x 3');
      logInfo(`onSizeChange(width=0, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0011
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0011
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=10) yields "0 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0011 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 10);
      logInfo(`onSizeChange(width=0, height=10): actual=${actual}`);
      expect(actual).assertEqual('0 x 10');
      logInfo(`onSizeChange(width=0, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0012
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0012
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=96) yields "0 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0012 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 96);
      logInfo(`onSizeChange(width=0, height=96): actual=${actual}`);
      expect(actual).assertEqual('0 x 96');
      logInfo(`onSizeChange(width=0, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0013
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0013
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=192) yields "0 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0013 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 192);
      logInfo(`onSizeChange(width=0, height=192): actual=${actual}`);
      expect(actual).assertEqual('0 x 192');
      logInfo(`onSizeChange(width=0, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0014
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0014
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=288) yields "0 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0014 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 288);
      logInfo(`onSizeChange(width=0, height=288): actual=${actual}`);
      expect(actual).assertEqual('0 x 288');
      logInfo(`onSizeChange(width=0, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0015
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0015
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=384) yields "0 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0015 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 384);
      logInfo(`onSizeChange(width=0, height=384): actual=${actual}`);
      expect(actual).assertEqual('0 x 384');
      logInfo(`onSizeChange(width=0, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0016
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0016
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=480) yields "0 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0016 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 480);
      logInfo(`onSizeChange(width=0, height=480): actual=${actual}`);
      expect(actual).assertEqual('0 x 480');
      logInfo(`onSizeChange(width=0, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0017
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0017
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=576) yields "0 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0017 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 576);
      logInfo(`onSizeChange(width=0, height=576): actual=${actual}`);
      expect(actual).assertEqual('0 x 576');
      logInfo(`onSizeChange(width=0, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0018
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0018
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=672) yields "0 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0018 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 672);
      logInfo(`onSizeChange(width=0, height=672): actual=${actual}`);
      expect(actual).assertEqual('0 x 672');
      logInfo(`onSizeChange(width=0, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0019
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0019
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=768) yields "0 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0019 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 768);
      logInfo(`onSizeChange(width=0, height=768): actual=${actual}`);
      expect(actual).assertEqual('0 x 768');
      logInfo(`onSizeChange(width=0, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0020
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0020
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=864) yields "0 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0020 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 864);
      logInfo(`onSizeChange(width=0, height=864): actual=${actual}`);
      expect(actual).assertEqual('0 x 864');
      logInfo(`onSizeChange(width=0, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0021
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0021
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=960) yields "0 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0021 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 960);
      logInfo(`onSizeChange(width=0, height=960): actual=${actual}`);
      expect(actual).assertEqual('0 x 960');
      logInfo(`onSizeChange(width=0, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0022
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0022
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1056) yields "0 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0022 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1056);
      logInfo(`onSizeChange(width=0, height=1056): actual=${actual}`);
      expect(actual).assertEqual('0 x 1056');
      logInfo(`onSizeChange(width=0, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0023
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0023
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1152) yields "0 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0023 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1152);
      logInfo(`onSizeChange(width=0, height=1152): actual=${actual}`);
      expect(actual).assertEqual('0 x 1152');
      logInfo(`onSizeChange(width=0, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0024
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0024
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1248) yields "0 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0024 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1248);
      logInfo(`onSizeChange(width=0, height=1248): actual=${actual}`);
      expect(actual).assertEqual('0 x 1248');
      logInfo(`onSizeChange(width=0, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0025
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0025
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1344) yields "0 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0025 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1344);
      logInfo(`onSizeChange(width=0, height=1344): actual=${actual}`);
      expect(actual).assertEqual('0 x 1344');
      logInfo(`onSizeChange(width=0, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0026
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0026
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1440) yields "0 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0026 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1440);
      logInfo(`onSizeChange(width=0, height=1440): actual=${actual}`);
      expect(actual).assertEqual('0 x 1440');
      logInfo(`onSizeChange(width=0, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0027
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0027
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1536) yields "0 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0027 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1536);
      logInfo(`onSizeChange(width=0, height=1536): actual=${actual}`);
      expect(actual).assertEqual('0 x 1536');
      logInfo(`onSizeChange(width=0, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0028
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0028
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1632) yields "0 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0028 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1632);
      logInfo(`onSizeChange(width=0, height=1632): actual=${actual}`);
      expect(actual).assertEqual('0 x 1632');
      logInfo(`onSizeChange(width=0, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0029
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0029
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1728) yields "0 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0029 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1728);
      logInfo(`onSizeChange(width=0, height=1728): actual=${actual}`);
      expect(actual).assertEqual('0 x 1728');
      logInfo(`onSizeChange(width=0, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0030
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0030
     * @tc.desc      RatioPageState.onSizeChange(width=0, height=1824) yields "0 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0030 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(0, 1824);
      logInfo(`onSizeChange(width=0, height=1824): actual=${actual}`);
      expect(actual).assertEqual('0 x 1824');
      logInfo(`onSizeChange(width=0, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange(width=0, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0031
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0031
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=0) yields "1 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0031 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 0);
      logInfo(`onSizeChange(width=1, height=0): actual=${actual}`);
      expect(actual).assertEqual('1 x 0');
      logInfo(`onSizeChange(width=1, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0032
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0032
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1) yields "1 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0032 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1);
      logInfo(`onSizeChange(width=1, height=1): actual=${actual}`);
      expect(actual).assertEqual('1 x 1');
      logInfo(`onSizeChange(width=1, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0033
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0033
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=100) yields "1 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0033 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 100);
      logInfo(`onSizeChange(width=1, height=100): actual=${actual}`);
      expect(actual).assertEqual('1 x 100');
      logInfo(`onSizeChange(width=1, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0034
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0034
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=360) yields "1 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0034 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 360);
      logInfo(`onSizeChange(width=1, height=360): actual=${actual}`);
      expect(actual).assertEqual('1 x 360');
      logInfo(`onSizeChange(width=1, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0035
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0035
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=720) yields "1 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0035 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 720);
      logInfo(`onSizeChange(width=1, height=720): actual=${actual}`);
      expect(actual).assertEqual('1 x 720');
      logInfo(`onSizeChange(width=1, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0036
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0036
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1080) yields "1 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0036 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1080);
      logInfo(`onSizeChange(width=1, height=1080): actual=${actual}`);
      expect(actual).assertEqual('1 x 1080');
      logInfo(`onSizeChange(width=1, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0037
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0037
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1920) yields "1 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0037 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1920);
      logInfo(`onSizeChange(width=1, height=1920): actual=${actual}`);
      expect(actual).assertEqual('1 x 1920');
      logInfo(`onSizeChange(width=1, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0038
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0038
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=-1) yields "1 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0038 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, -1);
      logInfo(`onSizeChange(width=1, height=-1): actual=${actual}`);
      expect(actual).assertEqual('1 x -1');
      logInfo(`onSizeChange(width=1, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0039
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0039
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=2) yields "1 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0039 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 2);
      logInfo(`onSizeChange(width=1, height=2): actual=${actual}`);
      expect(actual).assertEqual('1 x 2');
      logInfo(`onSizeChange(width=1, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0040
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0040
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=3) yields "1 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0040 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 3);
      logInfo(`onSizeChange(width=1, height=3): actual=${actual}`);
      expect(actual).assertEqual('1 x 3');
      logInfo(`onSizeChange(width=1, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0041
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0041
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=10) yields "1 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0041 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 10);
      logInfo(`onSizeChange(width=1, height=10): actual=${actual}`);
      expect(actual).assertEqual('1 x 10');
      logInfo(`onSizeChange(width=1, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0042
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0042
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=96) yields "1 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0042 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 96);
      logInfo(`onSizeChange(width=1, height=96): actual=${actual}`);
      expect(actual).assertEqual('1 x 96');
      logInfo(`onSizeChange(width=1, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0043
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0043
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=192) yields "1 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0043 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 192);
      logInfo(`onSizeChange(width=1, height=192): actual=${actual}`);
      expect(actual).assertEqual('1 x 192');
      logInfo(`onSizeChange(width=1, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0044
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0044
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=288) yields "1 x 288"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0044 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 288);
      logInfo(`onSizeChange(width=1, height=288): actual=${actual}`);
      expect(actual).assertEqual('1 x 288');
      logInfo(`onSizeChange(width=1, height=288) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=288) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0045
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0045
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=384) yields "1 x 384"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0045 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 384);
      logInfo(`onSizeChange(width=1, height=384): actual=${actual}`);
      expect(actual).assertEqual('1 x 384');
      logInfo(`onSizeChange(width=1, height=384) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=384) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('384');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0046
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0046
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=480) yields "1 x 480"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0046 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 480);
      logInfo(`onSizeChange(width=1, height=480): actual=${actual}`);
      expect(actual).assertEqual('1 x 480');
      logInfo(`onSizeChange(width=1, height=480) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=480) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0047
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0047
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=576) yields "1 x 576"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0047 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 576);
      logInfo(`onSizeChange(width=1, height=576): actual=${actual}`);
      expect(actual).assertEqual('1 x 576');
      logInfo(`onSizeChange(width=1, height=576) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=576) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0048
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0048
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=672) yields "1 x 672"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0048 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 672);
      logInfo(`onSizeChange(width=1, height=672): actual=${actual}`);
      expect(actual).assertEqual('1 x 672');
      logInfo(`onSizeChange(width=1, height=672) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=672) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0049
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0049
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=768) yields "1 x 768"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0049 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 768);
      logInfo(`onSizeChange(width=1, height=768): actual=${actual}`);
      expect(actual).assertEqual('1 x 768');
      logInfo(`onSizeChange(width=1, height=768) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=768) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0050
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0050
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=864) yields "1 x 864"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0050 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 864);
      logInfo(`onSizeChange(width=1, height=864): actual=${actual}`);
      expect(actual).assertEqual('1 x 864');
      logInfo(`onSizeChange(width=1, height=864) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=864) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0051
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0051
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=960) yields "1 x 960"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0051 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 960);
      logInfo(`onSizeChange(width=1, height=960): actual=${actual}`);
      expect(actual).assertEqual('1 x 960');
      logInfo(`onSizeChange(width=1, height=960) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=960) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0052
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0052
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1056) yields "1 x 1056"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0052 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1056);
      logInfo(`onSizeChange(width=1, height=1056): actual=${actual}`);
      expect(actual).assertEqual('1 x 1056');
      logInfo(`onSizeChange(width=1, height=1056) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1056) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0053
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0053
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1152) yields "1 x 1152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0053 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1152);
      logInfo(`onSizeChange(width=1, height=1152): actual=${actual}`);
      expect(actual).assertEqual('1 x 1152');
      logInfo(`onSizeChange(width=1, height=1152) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1152) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0054
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0054
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1248) yields "1 x 1248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0054 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1248);
      logInfo(`onSizeChange(width=1, height=1248): actual=${actual}`);
      expect(actual).assertEqual('1 x 1248');
      logInfo(`onSizeChange(width=1, height=1248) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1248) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0055
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0055
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1344) yields "1 x 1344"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0055 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1344);
      logInfo(`onSizeChange(width=1, height=1344): actual=${actual}`);
      expect(actual).assertEqual('1 x 1344');
      logInfo(`onSizeChange(width=1, height=1344) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1344) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0056
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0056
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1440) yields "1 x 1440"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0056 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1440);
      logInfo(`onSizeChange(width=1, height=1440): actual=${actual}`);
      expect(actual).assertEqual('1 x 1440');
      logInfo(`onSizeChange(width=1, height=1440) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1440) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0057
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0057
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1536) yields "1 x 1536"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0057 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1536);
      logInfo(`onSizeChange(width=1, height=1536): actual=${actual}`);
      expect(actual).assertEqual('1 x 1536');
      logInfo(`onSizeChange(width=1, height=1536) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1536) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0058
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0058
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1632) yields "1 x 1632"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0058 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1632);
      logInfo(`onSizeChange(width=1, height=1632): actual=${actual}`);
      expect(actual).assertEqual('1 x 1632');
      logInfo(`onSizeChange(width=1, height=1632) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1632) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0059
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0059
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1728) yields "1 x 1728"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0059 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1728);
      logInfo(`onSizeChange(width=1, height=1728): actual=${actual}`);
      expect(actual).assertEqual('1 x 1728');
      logInfo(`onSizeChange(width=1, height=1728) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1728) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0060
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0060
     * @tc.desc      RatioPageState.onSizeChange(width=1, height=1824) yields "1 x 1824"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0060 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(1, 1824);
      logInfo(`onSizeChange(width=1, height=1824): actual=${actual}`);
      expect(actual).assertEqual('1 x 1824');
      logInfo(`onSizeChange(width=1, height=1824) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange(width=1, height=1824) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0061
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0061
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=0) yields "100 x 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0061 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 0);
      logInfo(`onSizeChange(width=100, height=0): actual=${actual}`);
      expect(actual).assertEqual('100 x 0');
      logInfo(`onSizeChange(width=100, height=0) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=0) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0062
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0062
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1) yields "100 x 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0062 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1);
      logInfo(`onSizeChange(width=100, height=1): actual=${actual}`);
      expect(actual).assertEqual('100 x 1');
      logInfo(`onSizeChange(width=100, height=1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0063
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0063
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=100) yields "100 x 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0063 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 100);
      logInfo(`onSizeChange(width=100, height=100): actual=${actual}`);
      expect(actual).assertEqual('100 x 100');
      logInfo(`onSizeChange(width=100, height=100) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=100) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0064
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0064
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=360) yields "100 x 360"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0064 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 360);
      logInfo(`onSizeChange(width=100, height=360): actual=${actual}`);
      expect(actual).assertEqual('100 x 360');
      logInfo(`onSizeChange(width=100, height=360) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=360) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0065
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0065
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=720) yields "100 x 720"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0065 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 720);
      logInfo(`onSizeChange(width=100, height=720): actual=${actual}`);
      expect(actual).assertEqual('100 x 720');
      logInfo(`onSizeChange(width=100, height=720) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=720) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0066
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0066
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1080) yields "100 x 1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0066 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1080);
      logInfo(`onSizeChange(width=100, height=1080): actual=${actual}`);
      expect(actual).assertEqual('100 x 1080');
      logInfo(`onSizeChange(width=100, height=1080) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1080) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0067
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0067
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=1920) yields "100 x 1920"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0067 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 1920);
      logInfo(`onSizeChange(width=100, height=1920): actual=${actual}`);
      expect(actual).assertEqual('100 x 1920');
      logInfo(`onSizeChange(width=100, height=1920) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=1920) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0068
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0068
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=-1) yields "100 x -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0068 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, -1);
      logInfo(`onSizeChange(width=100, height=-1): actual=${actual}`);
      expect(actual).assertEqual('100 x -1');
      logInfo(`onSizeChange(width=100, height=-1) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=-1) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0069
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0069
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=2) yields "100 x 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0069 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 2);
      logInfo(`onSizeChange(width=100, height=2): actual=${actual}`);
      expect(actual).assertEqual('100 x 2');
      logInfo(`onSizeChange(width=100, height=2) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=2) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0070
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0070
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=3) yields "100 x 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0070 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 3);
      logInfo(`onSizeChange(width=100, height=3): actual=${actual}`);
      expect(actual).assertEqual('100 x 3');
      logInfo(`onSizeChange(width=100, height=3) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=3) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0071
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0071
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=10) yields "100 x 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0071 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 10);
      logInfo(`onSizeChange(width=100, height=10): actual=${actual}`);
      expect(actual).assertEqual('100 x 10');
      logInfo(`onSizeChange(width=100, height=10) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=10) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0072
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0072
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=96) yields "100 x 96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0072 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 96);
      logInfo(`onSizeChange(width=100, height=96): actual=${actual}`);
      expect(actual).assertEqual('100 x 96');
      logInfo(`onSizeChange(width=100, height=96) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=96) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_ON_SIZE_CHANGE_0073
     * @tc.name      WindowRatio_RatioPageStateOnSizeChange_0073
     * @tc.desc      RatioPageState.onSizeChange(width=100, height=192) yields "100 x 192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateOnSizeChange_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0073 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.onSizeChange(100, 192);
      logInfo(`onSizeChange(width=100, height=192): actual=${actual}`);
      expect(actual).assertEqual('100 x 192');
      logInfo(`onSizeChange(width=100, height=192) state: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange(width=100, height=192) state: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`${BUNDLE}RatioPageStateOnSizeChange_0073 end`);
    });
  });
}
