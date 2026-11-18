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

/** Logic checks for RatioPageState.select (67 cases). */
export default function ratioPageStateSelectTest(): void {
  describe('RatioPageStateSelectTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0001
     * @tc.name      WindowRatio_RatioPageStateSelect_0001
     * @tc.desc      RatioPageState.select(index=0) yields "4:3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioPageStateSelect_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0001 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(0);
      logInfo(`select(index=0): actual=${actual}`);
      expect(actual).assertEqual('4:3');
      logInfo(`${BUNDLE}RatioPageStateSelect_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0002
     * @tc.name      WindowRatio_RatioPageStateSelect_0002
     * @tc.desc      RatioPageState.select(index=1) yields "1:1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioPageStateSelect_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0002 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(1);
      logInfo(`select(index=1): actual=${actual}`);
      expect(actual).assertEqual('1:1');
      logInfo(`select(index=1) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(1);
      logInfo(`select(index=1) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertEqual(1);
      logInfo(`select(index=1) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('1:1');
      logInfo(`${BUNDLE}RatioPageStateSelect_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0003
     * @tc.name      WindowRatio_RatioPageStateSelect_0003
     * @tc.desc      RatioPageState.select(index=2) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0003 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(2);
      logInfo(`select(index=2): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=2) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(2);
      logInfo(`select(index=2) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=2) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0004
     * @tc.name      WindowRatio_RatioPageStateSelect_0004
     * @tc.desc      RatioPageState.select(index=-1) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0004 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-1);
      logInfo(`select(index=-1): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-1) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-1);
      logInfo(`select(index=-1) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-1) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0005
     * @tc.name      WindowRatio_RatioPageStateSelect_0005
     * @tc.desc      RatioPageState.select(index=5) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0005 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(5);
      logInfo(`select(index=5): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=5) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(5);
      logInfo(`select(index=5) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=5) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0006
     * @tc.name      WindowRatio_RatioPageStateSelect_0006
     * @tc.desc      RatioPageState.select(index=10) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0006 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(10);
      logInfo(`select(index=10): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=10) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(10);
      logInfo(`select(index=10) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=10) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0007
     * @tc.name      WindowRatio_RatioPageStateSelect_0007
     * @tc.desc      RatioPageState.select(index=3) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0007 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(3);
      logInfo(`select(index=3): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=3) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(3);
      logInfo(`select(index=3) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=3) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0008
     * @tc.name      WindowRatio_RatioPageStateSelect_0008
     * @tc.desc      RatioPageState.select(index=100) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0008 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(100);
      logInfo(`select(index=100): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=100) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(100);
      logInfo(`select(index=100) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=100) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0009
     * @tc.name      WindowRatio_RatioPageStateSelect_0009
     * @tc.desc      RatioPageState.select(index=15) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0009 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(15);
      logInfo(`select(index=15): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=15) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(15);
      logInfo(`select(index=15) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=15) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0010
     * @tc.name      WindowRatio_RatioPageStateSelect_0010
     * @tc.desc      RatioPageState.select(index=20) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0010 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(20);
      logInfo(`select(index=20): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=20) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(20);
      logInfo(`select(index=20) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=20) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0011
     * @tc.name      WindowRatio_RatioPageStateSelect_0011
     * @tc.desc      RatioPageState.select(index=25) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0011 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(25);
      logInfo(`select(index=25): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=25) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(25);
      logInfo(`select(index=25) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=25) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0012
     * @tc.name      WindowRatio_RatioPageStateSelect_0012
     * @tc.desc      RatioPageState.select(index=30) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0012 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(30);
      logInfo(`select(index=30): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=30) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(30);
      logInfo(`select(index=30) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=30) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0013
     * @tc.name      WindowRatio_RatioPageStateSelect_0013
     * @tc.desc      RatioPageState.select(index=35) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0013 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(35);
      logInfo(`select(index=35): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=35) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(35);
      logInfo(`select(index=35) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=35) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0014
     * @tc.name      WindowRatio_RatioPageStateSelect_0014
     * @tc.desc      RatioPageState.select(index=40) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0014 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(40);
      logInfo(`select(index=40): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=40) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(40);
      logInfo(`select(index=40) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=40) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0015
     * @tc.name      WindowRatio_RatioPageStateSelect_0015
     * @tc.desc      RatioPageState.select(index=45) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0015 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(45);
      logInfo(`select(index=45): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=45) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(45);
      logInfo(`select(index=45) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=45) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0016
     * @tc.name      WindowRatio_RatioPageStateSelect_0016
     * @tc.desc      RatioPageState.select(index=50) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0016 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(50);
      logInfo(`select(index=50): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=50) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(50);
      logInfo(`select(index=50) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=50) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0017
     * @tc.name      WindowRatio_RatioPageStateSelect_0017
     * @tc.desc      RatioPageState.select(index=55) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0017 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(55);
      logInfo(`select(index=55): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=55) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(55);
      logInfo(`select(index=55) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=55) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0018
     * @tc.name      WindowRatio_RatioPageStateSelect_0018
     * @tc.desc      RatioPageState.select(index=60) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0018 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(60);
      logInfo(`select(index=60): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=60) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(60);
      logInfo(`select(index=60) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=60) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0019
     * @tc.name      WindowRatio_RatioPageStateSelect_0019
     * @tc.desc      RatioPageState.select(index=65) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0019 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(65);
      logInfo(`select(index=65): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=65) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(65);
      logInfo(`select(index=65) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=65) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0020
     * @tc.name      WindowRatio_RatioPageStateSelect_0020
     * @tc.desc      RatioPageState.select(index=70) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0020 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(70);
      logInfo(`select(index=70): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=70) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(70);
      logInfo(`select(index=70) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=70) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0021
     * @tc.name      WindowRatio_RatioPageStateSelect_0021
     * @tc.desc      RatioPageState.select(index=75) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0021 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(75);
      logInfo(`select(index=75): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=75) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(75);
      logInfo(`select(index=75) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=75) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0022
     * @tc.name      WindowRatio_RatioPageStateSelect_0022
     * @tc.desc      RatioPageState.select(index=80) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0022 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(80);
      logInfo(`select(index=80): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=80) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(80);
      logInfo(`select(index=80) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=80) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0023
     * @tc.name      WindowRatio_RatioPageStateSelect_0023
     * @tc.desc      RatioPageState.select(index=85) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0023 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(85);
      logInfo(`select(index=85): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=85) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(85);
      logInfo(`select(index=85) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=85) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0024
     * @tc.name      WindowRatio_RatioPageStateSelect_0024
     * @tc.desc      RatioPageState.select(index=90) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0024 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(90);
      logInfo(`select(index=90): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=90) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(90);
      logInfo(`select(index=90) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=90) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0025
     * @tc.name      WindowRatio_RatioPageStateSelect_0025
     * @tc.desc      RatioPageState.select(index=95) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0025 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(95);
      logInfo(`select(index=95): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=95) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(95);
      logInfo(`select(index=95) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=95) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0026
     * @tc.name      WindowRatio_RatioPageStateSelect_0026
     * @tc.desc      RatioPageState.select(index=105) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0026 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(105);
      logInfo(`select(index=105): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=105) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(105);
      logInfo(`select(index=105) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=105) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0027
     * @tc.name      WindowRatio_RatioPageStateSelect_0027
     * @tc.desc      RatioPageState.select(index=110) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0027 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(110);
      logInfo(`select(index=110): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=110) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(110);
      logInfo(`select(index=110) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=110) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0028
     * @tc.name      WindowRatio_RatioPageStateSelect_0028
     * @tc.desc      RatioPageState.select(index=115) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0028 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(115);
      logInfo(`select(index=115): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=115) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(115);
      logInfo(`select(index=115) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=115) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0029
     * @tc.name      WindowRatio_RatioPageStateSelect_0029
     * @tc.desc      RatioPageState.select(index=120) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0029 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(120);
      logInfo(`select(index=120): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=120) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(120);
      logInfo(`select(index=120) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=120) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0030
     * @tc.name      WindowRatio_RatioPageStateSelect_0030
     * @tc.desc      RatioPageState.select(index=125) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0030 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(125);
      logInfo(`select(index=125): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=125) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(125);
      logInfo(`select(index=125) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=125) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0031
     * @tc.name      WindowRatio_RatioPageStateSelect_0031
     * @tc.desc      RatioPageState.select(index=130) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0031 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(130);
      logInfo(`select(index=130): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=130) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(130);
      logInfo(`select(index=130) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=130) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0032
     * @tc.name      WindowRatio_RatioPageStateSelect_0032
     * @tc.desc      RatioPageState.select(index=135) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0032 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(135);
      logInfo(`select(index=135): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=135) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(135);
      logInfo(`select(index=135) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=135) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0033
     * @tc.name      WindowRatio_RatioPageStateSelect_0033
     * @tc.desc      RatioPageState.select(index=140) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0033 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(140);
      logInfo(`select(index=140): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=140) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(140);
      logInfo(`select(index=140) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=140) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0034
     * @tc.name      WindowRatio_RatioPageStateSelect_0034
     * @tc.desc      RatioPageState.select(index=145) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0034 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(145);
      logInfo(`select(index=145): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=145) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(145);
      logInfo(`select(index=145) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=145) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0035
     * @tc.name      WindowRatio_RatioPageStateSelect_0035
     * @tc.desc      RatioPageState.select(index=150) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0035 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(150);
      logInfo(`select(index=150): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=150) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(150);
      logInfo(`select(index=150) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=150) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0036
     * @tc.name      WindowRatio_RatioPageStateSelect_0036
     * @tc.desc      RatioPageState.select(index=155) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0036 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(155);
      logInfo(`select(index=155): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=155) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(155);
      logInfo(`select(index=155) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=155) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0037
     * @tc.name      WindowRatio_RatioPageStateSelect_0037
     * @tc.desc      RatioPageState.select(index=160) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0037 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(160);
      logInfo(`select(index=160): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=160) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(160);
      logInfo(`select(index=160) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=160) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0038
     * @tc.name      WindowRatio_RatioPageStateSelect_0038
     * @tc.desc      RatioPageState.select(index=165) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0038 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(165);
      logInfo(`select(index=165): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=165) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(165);
      logInfo(`select(index=165) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=165) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0039
     * @tc.name      WindowRatio_RatioPageStateSelect_0039
     * @tc.desc      RatioPageState.select(index=170) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0039 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(170);
      logInfo(`select(index=170): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=170) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(170);
      logInfo(`select(index=170) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=170) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0040
     * @tc.name      WindowRatio_RatioPageStateSelect_0040
     * @tc.desc      RatioPageState.select(index=175) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0040 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(175);
      logInfo(`select(index=175): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=175) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(175);
      logInfo(`select(index=175) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=175) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0041
     * @tc.name      WindowRatio_RatioPageStateSelect_0041
     * @tc.desc      RatioPageState.select(index=180) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0041 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(180);
      logInfo(`select(index=180): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=180) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(180);
      logInfo(`select(index=180) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=180) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0042
     * @tc.name      WindowRatio_RatioPageStateSelect_0042
     * @tc.desc      RatioPageState.select(index=185) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0042 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(185);
      logInfo(`select(index=185): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=185) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(185);
      logInfo(`select(index=185) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=185) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0043
     * @tc.name      WindowRatio_RatioPageStateSelect_0043
     * @tc.desc      RatioPageState.select(index=190) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0043 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(190);
      logInfo(`select(index=190): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=190) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(190);
      logInfo(`select(index=190) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=190) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0044
     * @tc.name      WindowRatio_RatioPageStateSelect_0044
     * @tc.desc      RatioPageState.select(index=195) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0044 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(195);
      logInfo(`select(index=195): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=195) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(195);
      logInfo(`select(index=195) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=195) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0045
     * @tc.name      WindowRatio_RatioPageStateSelect_0045
     * @tc.desc      RatioPageState.select(index=200) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0045 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(200);
      logInfo(`select(index=200): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=200) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(200);
      logInfo(`select(index=200) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=200) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0046
     * @tc.name      WindowRatio_RatioPageStateSelect_0046
     * @tc.desc      RatioPageState.select(index=34) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0046 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(34);
      logInfo(`select(index=34): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=34) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(34);
      logInfo(`select(index=34) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=34) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0047
     * @tc.name      WindowRatio_RatioPageStateSelect_0047
     * @tc.desc      RatioPageState.select(index=-52) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0047 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-52);
      logInfo(`select(index=-52): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-52) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-52);
      logInfo(`select(index=-52) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-52) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0048
     * @tc.name      WindowRatio_RatioPageStateSelect_0048
     * @tc.desc      RatioPageState.select(index=-91) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0048 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-91);
      logInfo(`select(index=-91): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-91) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-91);
      logInfo(`select(index=-91) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-91) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0049
     * @tc.name      WindowRatio_RatioPageStateSelect_0049
     * @tc.desc      RatioPageState.select(index=-99) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0049 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-99);
      logInfo(`select(index=-99): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-99) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-99);
      logInfo(`select(index=-99) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-99) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0050
     * @tc.name      WindowRatio_RatioPageStateSelect_0050
     * @tc.desc      RatioPageState.select(index=169) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0050 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(169);
      logInfo(`select(index=169): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=169) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(169);
      logInfo(`select(index=169) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=169) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0051
     * @tc.name      WindowRatio_RatioPageStateSelect_0051
     * @tc.desc      RatioPageState.select(index=108) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0051 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(108);
      logInfo(`select(index=108): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=108) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(108);
      logInfo(`select(index=108) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=108) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0052
     * @tc.name      WindowRatio_RatioPageStateSelect_0052
     * @tc.desc      RatioPageState.select(index=4) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0052 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(4);
      logInfo(`select(index=4): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=4) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(4);
      logInfo(`select(index=4) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=4) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0053
     * @tc.name      WindowRatio_RatioPageStateSelect_0053
     * @tc.desc      RatioPageState.select(index=-23) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0053 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-23);
      logInfo(`select(index=-23): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-23) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-23);
      logInfo(`select(index=-23) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-23) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0054
     * @tc.name      WindowRatio_RatioPageStateSelect_0054
     * @tc.desc      RatioPageState.select(index=-4) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0054 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-4);
      logInfo(`select(index=-4): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-4) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-4);
      logInfo(`select(index=-4) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-4) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0055
     * @tc.name      WindowRatio_RatioPageStateSelect_0055
     * @tc.desc      RatioPageState.select(index=27) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0055 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(27);
      logInfo(`select(index=27): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=27) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(27);
      logInfo(`select(index=27) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=27) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0056
     * @tc.name      WindowRatio_RatioPageStateSelect_0056
     * @tc.desc      RatioPageState.select(index=-39) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0056 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-39);
      logInfo(`select(index=-39): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-39) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-39);
      logInfo(`select(index=-39) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-39) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0057
     * @tc.name      WindowRatio_RatioPageStateSelect_0057
     * @tc.desc      RatioPageState.select(index=35.98) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0057 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(35.98);
      logInfo(`select(index=35.98): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=35.98) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(35.98, PRECISION);
      logInfo(`select(index=35.98) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=35.98) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0058
     * @tc.name      WindowRatio_RatioPageStateSelect_0058
     * @tc.desc      RatioPageState.select(index=182) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0058 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(182);
      logInfo(`select(index=182): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=182) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(182);
      logInfo(`select(index=182) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=182) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0059
     * @tc.name      WindowRatio_RatioPageStateSelect_0059
     * @tc.desc      RatioPageState.select(index=197) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0059 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(197);
      logInfo(`select(index=197): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=197) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(197);
      logInfo(`select(index=197) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=197) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0060
     * @tc.name      WindowRatio_RatioPageStateSelect_0060
     * @tc.desc      RatioPageState.select(index=42) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0060 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(42);
      logInfo(`select(index=42): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=42) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(42);
      logInfo(`select(index=42) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=42) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0061
     * @tc.name      WindowRatio_RatioPageStateSelect_0061
     * @tc.desc      RatioPageState.select(index=-63) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0061 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-63);
      logInfo(`select(index=-63): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-63) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-63);
      logInfo(`select(index=-63) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-63) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0062
     * @tc.name      WindowRatio_RatioPageStateSelect_0062
     * @tc.desc      RatioPageState.select(index=112) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0062 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(112);
      logInfo(`select(index=112): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=112) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(112);
      logInfo(`select(index=112) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=112) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0063
     * @tc.name      WindowRatio_RatioPageStateSelect_0063
     * @tc.desc      RatioPageState.select(index=176) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0063 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(176);
      logInfo(`select(index=176): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=176) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(176);
      logInfo(`select(index=176) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=176) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0064
     * @tc.name      WindowRatio_RatioPageStateSelect_0064
     * @tc.desc      RatioPageState.select(index=-78) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0064 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-78);
      logInfo(`select(index=-78): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-78) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-78);
      logInfo(`select(index=-78) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-78) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0065
     * @tc.name      WindowRatio_RatioPageStateSelect_0065
     * @tc.desc      RatioPageState.select(index=106) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0065 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(106);
      logInfo(`select(index=106): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=106) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(106);
      logInfo(`select(index=106) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=106) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0066
     * @tc.name      WindowRatio_RatioPageStateSelect_0066
     * @tc.desc      RatioPageState.select(index=-6) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RatioPageStateSelect_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0066 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(-6);
      logInfo(`select(index=-6): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=-6) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`select(index=-6) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=-6) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_SELECT_0067
     * @tc.name      WindowRatio_RatioPageStateSelect_0067
     * @tc.desc      RatioPageState.select(index=17.23) yields "16:9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateSelect_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateSelect_0067 begin`);
      const subject: RatioPageState = new RatioPageState();
      const actual: string = subject.select(17.23);
      logInfo(`select(index=17.23): actual=${actual}`);
      expect(actual).assertEqual('16:9');
      logInfo(`select(index=17.23) state: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(17.23, PRECISION);
      logInfo(`select(index=17.23) state: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select(index=17.23) state: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateSelect_0067 end`);
    });
  });
}
