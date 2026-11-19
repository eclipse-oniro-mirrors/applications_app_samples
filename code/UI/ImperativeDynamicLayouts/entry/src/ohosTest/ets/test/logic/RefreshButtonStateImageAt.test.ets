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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RefreshButtonState } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RefreshButtonState.imageAt (90 cases). */
export default function refreshButtonStateImageAtTest(): void {
  describe('RefreshButtonStateImageAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0001
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0001
     * @tc.desc      RefreshButtonState.imageAt(index=0) yields "app.media.search"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0001 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(0);
      logInfo(`imageAt(index=0): actual=${actual}`);
      expect(actual).assertEqual('app.media.search');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0002
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0002
     * @tc.desc      RefreshButtonState.imageAt(index=1) yields "app.media.movie1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0002 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(1);
      logInfo(`imageAt(index=1): actual=${actual}`);
      expect(actual).assertEqual('app.media.movie1');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0003
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0003
     * @tc.desc      RefreshButtonState.imageAt(index=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0003 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-1);
      logInfo(`imageAt(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0004
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0004
     * @tc.desc      RefreshButtonState.imageAt(index=2) yields "app.media.movie2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0004 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(2);
      logInfo(`imageAt(index=2): actual=${actual}`);
      expect(actual).assertEqual('app.media.movie2');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0005
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0005
     * @tc.desc      RefreshButtonState.imageAt(index=5) yields "app.media.movie5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0005 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(5);
      logInfo(`imageAt(index=5): actual=${actual}`);
      expect(actual).assertEqual('app.media.movie5');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0006
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0006
     * @tc.desc      RefreshButtonState.imageAt(index=3) yields "app.media.movie3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0006 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(3);
      logInfo(`imageAt(index=3): actual=${actual}`);
      expect(actual).assertEqual('app.media.movie3');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0007
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0007
     * @tc.desc      RefreshButtonState.imageAt(index=4) yields "app.media.movie4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0007 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(4);
      logInfo(`imageAt(index=4): actual=${actual}`);
      expect(actual).assertEqual('app.media.movie4');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0008
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0008
     * @tc.desc      RefreshButtonState.imageAt(index=10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0008 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(10);
      logInfo(`imageAt(index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0008 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0009
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0009
     * @tc.desc      RefreshButtonState.imageAt(index=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0009 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(100);
      logInfo(`imageAt(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0009 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0010
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0010
     * @tc.desc      RefreshButtonState.imageAt(index=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0010 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(15);
      logInfo(`imageAt(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0010 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0011
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0011
     * @tc.desc      RefreshButtonState.imageAt(index=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0011 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(20);
      logInfo(`imageAt(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0011 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0012
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0012
     * @tc.desc      RefreshButtonState.imageAt(index=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0012 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(25);
      logInfo(`imageAt(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0012 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0013
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0013
     * @tc.desc      RefreshButtonState.imageAt(index=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0013 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(30);
      logInfo(`imageAt(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0013 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0014
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0014
     * @tc.desc      RefreshButtonState.imageAt(index=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0014 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(35);
      logInfo(`imageAt(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0014 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0015
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0015
     * @tc.desc      RefreshButtonState.imageAt(index=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0015 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(40);
      logInfo(`imageAt(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0015 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0016
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0016
     * @tc.desc      RefreshButtonState.imageAt(index=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0016 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(45);
      logInfo(`imageAt(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0016 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0017
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0017
     * @tc.desc      RefreshButtonState.imageAt(index=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0017 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(50);
      logInfo(`imageAt(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0017 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0018
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0018
     * @tc.desc      RefreshButtonState.imageAt(index=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0018 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(55);
      logInfo(`imageAt(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0018 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0019
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0019
     * @tc.desc      RefreshButtonState.imageAt(index=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0019 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(60);
      logInfo(`imageAt(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0019 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0020
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0020
     * @tc.desc      RefreshButtonState.imageAt(index=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0020 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(65);
      logInfo(`imageAt(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0020 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0021
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0021
     * @tc.desc      RefreshButtonState.imageAt(index=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0021 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(70);
      logInfo(`imageAt(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0021 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0022
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0022
     * @tc.desc      RefreshButtonState.imageAt(index=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0022 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(75);
      logInfo(`imageAt(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0022 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0023
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0023
     * @tc.desc      RefreshButtonState.imageAt(index=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0023 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(80);
      logInfo(`imageAt(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0023 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0024
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0024
     * @tc.desc      RefreshButtonState.imageAt(index=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0024 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(85);
      logInfo(`imageAt(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0024 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0025
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0025
     * @tc.desc      RefreshButtonState.imageAt(index=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0025 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(90);
      logInfo(`imageAt(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0025 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0026
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0026
     * @tc.desc      RefreshButtonState.imageAt(index=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0026 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(95);
      logInfo(`imageAt(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0026 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0027
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0027
     * @tc.desc      RefreshButtonState.imageAt(index=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0027 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(105);
      logInfo(`imageAt(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0027 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0028
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0028
     * @tc.desc      RefreshButtonState.imageAt(index=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0028 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(110);
      logInfo(`imageAt(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0028 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0029
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0029
     * @tc.desc      RefreshButtonState.imageAt(index=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0029 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(115);
      logInfo(`imageAt(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0029 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0030
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0030
     * @tc.desc      RefreshButtonState.imageAt(index=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0030 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(120);
      logInfo(`imageAt(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0030 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0031
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0031
     * @tc.desc      RefreshButtonState.imageAt(index=125) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0031 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(125);
      logInfo(`imageAt(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0031 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0032
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0032
     * @tc.desc      RefreshButtonState.imageAt(index=130) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0032 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(130);
      logInfo(`imageAt(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0032 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0033
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0033
     * @tc.desc      RefreshButtonState.imageAt(index=135) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0033 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(135);
      logInfo(`imageAt(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0033 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0034
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0034
     * @tc.desc      RefreshButtonState.imageAt(index=140) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0034 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(140);
      logInfo(`imageAt(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0034 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0035
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0035
     * @tc.desc      RefreshButtonState.imageAt(index=145) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0035 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(145);
      logInfo(`imageAt(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0035 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0036
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0036
     * @tc.desc      RefreshButtonState.imageAt(index=150) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0036 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(150);
      logInfo(`imageAt(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0036 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0037
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0037
     * @tc.desc      RefreshButtonState.imageAt(index=155) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0037 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(155);
      logInfo(`imageAt(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0037 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0038
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0038
     * @tc.desc      RefreshButtonState.imageAt(index=160) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0038 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(160);
      logInfo(`imageAt(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0038 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0039
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0039
     * @tc.desc      RefreshButtonState.imageAt(index=165) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0039 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(165);
      logInfo(`imageAt(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0039 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0040
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0040
     * @tc.desc      RefreshButtonState.imageAt(index=170) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0040 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(170);
      logInfo(`imageAt(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0040 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0041
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0041
     * @tc.desc      RefreshButtonState.imageAt(index=175) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0041 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(175);
      logInfo(`imageAt(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0041 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0042
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0042
     * @tc.desc      RefreshButtonState.imageAt(index=180) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0042 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(180);
      logInfo(`imageAt(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0042 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0043
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0043
     * @tc.desc      RefreshButtonState.imageAt(index=185) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0043 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(185);
      logInfo(`imageAt(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0043 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0044
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0044
     * @tc.desc      RefreshButtonState.imageAt(index=190) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0044 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(190);
      logInfo(`imageAt(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0044 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0045
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0045
     * @tc.desc      RefreshButtonState.imageAt(index=195) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0045 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(195);
      logInfo(`imageAt(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0045 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0046
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0046
     * @tc.desc      RefreshButtonState.imageAt(index=200) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0046 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(200);
      logInfo(`imageAt(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0046 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0047
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0047
     * @tc.desc      RefreshButtonState.imageAt(index=133) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0047 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(133);
      logInfo(`imageAt(index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0047 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0048
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0048
     * @tc.desc      RefreshButtonState.imageAt(index=-65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0048 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-65);
      logInfo(`imageAt(index=-65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0048 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0049
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0049
     * @tc.desc      RefreshButtonState.imageAt(index=112) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0049 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(112);
      logInfo(`imageAt(index=112): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0049 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0050
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0050
     * @tc.desc      RefreshButtonState.imageAt(index=94.53) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0050 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(94.53);
      logInfo(`imageAt(index=94.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0050 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0051
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0051
     * @tc.desc      RefreshButtonState.imageAt(index=85.51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0051 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(85.51);
      logInfo(`imageAt(index=85.51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0051 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0052
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0052
     * @tc.desc      RefreshButtonState.imageAt(index=33.03) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0052 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(33.03);
      logInfo(`imageAt(index=33.03): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0052 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0053
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0053
     * @tc.desc      RefreshButtonState.imageAt(index=197) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0053 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(197);
      logInfo(`imageAt(index=197): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0053 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0054
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0054
     * @tc.desc      RefreshButtonState.imageAt(index=-72) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0054 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-72);
      logInfo(`imageAt(index=-72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0054 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0055
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0055
     * @tc.desc      RefreshButtonState.imageAt(index=103) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0055 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(103);
      logInfo(`imageAt(index=103): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0055 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0056
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0056
     * @tc.desc      RefreshButtonState.imageAt(index=176) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0056 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(176);
      logInfo(`imageAt(index=176): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0056 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0057
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0057
     * @tc.desc      RefreshButtonState.imageAt(index=-9) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0057 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-9);
      logInfo(`imageAt(index=-9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0057 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0058
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0058
     * @tc.desc      RefreshButtonState.imageAt(index=-6) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0058 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-6);
      logInfo(`imageAt(index=-6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0058 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0059
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0059
     * @tc.desc      RefreshButtonState.imageAt(index=-15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0059 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-15);
      logInfo(`imageAt(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0059 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0060
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0060
     * @tc.desc      RefreshButtonState.imageAt(index=33.7) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0060 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(33.7);
      logInfo(`imageAt(index=33.7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0060 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0061
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0061
     * @tc.desc      RefreshButtonState.imageAt(index=56) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0061 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(56);
      logInfo(`imageAt(index=56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0061 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0062
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0062
     * @tc.desc      RefreshButtonState.imageAt(index=28) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0062 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(28);
      logInfo(`imageAt(index=28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0062 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0063
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0063
     * @tc.desc      RefreshButtonState.imageAt(index=141) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0063 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(141);
      logInfo(`imageAt(index=141): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0063 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0064
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0064
     * @tc.desc      RefreshButtonState.imageAt(index=80.33) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0064 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(80.33);
      logInfo(`imageAt(index=80.33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0064 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0065
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0065
     * @tc.desc      RefreshButtonState.imageAt(index=80.12) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0065 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(80.12);
      logInfo(`imageAt(index=80.12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0065 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0066
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0066
     * @tc.desc      RefreshButtonState.imageAt(index=106) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0066 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(106);
      logInfo(`imageAt(index=106): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0066 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0067
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0067
     * @tc.desc      RefreshButtonState.imageAt(index=48.76) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0067 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(48.76);
      logInfo(`imageAt(index=48.76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0067 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0068
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0068
     * @tc.desc      RefreshButtonState.imageAt(index=149) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0068 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(149);
      logInfo(`imageAt(index=149): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0068 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0069
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0069
     * @tc.desc      RefreshButtonState.imageAt(index=114) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0069 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(114);
      logInfo(`imageAt(index=114): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0069 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0070
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0070
     * @tc.desc      RefreshButtonState.imageAt(index=21.47) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0070 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(21.47);
      logInfo(`imageAt(index=21.47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0070 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0071
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0071
     * @tc.desc      RefreshButtonState.imageAt(index=17.32) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0071 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(17.32);
      logInfo(`imageAt(index=17.32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0071 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0072
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0072
     * @tc.desc      RefreshButtonState.imageAt(index=17) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0072 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(17);
      logInfo(`imageAt(index=17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0072 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0073
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0073
     * @tc.desc      RefreshButtonState.imageAt(index=-18) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0073 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-18);
      logInfo(`imageAt(index=-18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0073 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0074
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0074
     * @tc.desc      RefreshButtonState.imageAt(index=83.48) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0074 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(83.48);
      logInfo(`imageAt(index=83.48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0074 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0075
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0075
     * @tc.desc      RefreshButtonState.imageAt(index=52) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0075 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(52);
      logInfo(`imageAt(index=52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0075 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0076
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0076
     * @tc.desc      RefreshButtonState.imageAt(index=39) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0076 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(39);
      logInfo(`imageAt(index=39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0076 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0077
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0077
     * @tc.desc      RefreshButtonState.imageAt(index=70.52) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0077 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(70.52);
      logInfo(`imageAt(index=70.52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0077 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0078
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0078
     * @tc.desc      RefreshButtonState.imageAt(index=53) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0078 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(53);
      logInfo(`imageAt(index=53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0078 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0079
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0079
     * @tc.desc      RefreshButtonState.imageAt(index=81) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0079 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(81);
      logInfo(`imageAt(index=81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0079 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0080
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0080
     * @tc.desc      RefreshButtonState.imageAt(index=94) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0080 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(94);
      logInfo(`imageAt(index=94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0080 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0081
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0081
     * @tc.desc      RefreshButtonState.imageAt(index=-21) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0081 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-21);
      logInfo(`imageAt(index=-21): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0081 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0082
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0082
     * @tc.desc      RefreshButtonState.imageAt(index=139) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0082 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(139);
      logInfo(`imageAt(index=139): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0082 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0083
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0083
     * @tc.desc      RefreshButtonState.imageAt(index=-12) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0083 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-12);
      logInfo(`imageAt(index=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0083 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0084
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0084
     * @tc.desc      RefreshButtonState.imageAt(index=-19) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0084 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-19);
      logInfo(`imageAt(index=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0084 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0085
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0085
     * @tc.desc      RefreshButtonState.imageAt(index=102) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0085 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(102);
      logInfo(`imageAt(index=102): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0085 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0086
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0086
     * @tc.desc      RefreshButtonState.imageAt(index=36) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0086 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(36);
      logInfo(`imageAt(index=36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0086 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0087
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0087
     * @tc.desc      RefreshButtonState.imageAt(index=-3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0087 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-3);
      logInfo(`imageAt(index=-3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0087 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0088
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0088
     * @tc.desc      RefreshButtonState.imageAt(index=35.83) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0088 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(35.83);
      logInfo(`imageAt(index=35.83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0088 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0089
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0089
     * @tc.desc      RefreshButtonState.imageAt(index=109) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0089 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(109);
      logInfo(`imageAt(index=109): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0089 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0090
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0090
     * @tc.desc      RefreshButtonState.imageAt(index=-58) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0090 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-58);
      logInfo(`imageAt(index=-58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0090 end`);
    });
  });
}
