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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { navigatesAtTick } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for navigatesAtTick (50 cases). */
export default function navigatesAtTickTest(): void {
  describe('NavigatesAtTickTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0001
     * @tc.name      WindowStartIcon_NavigatesAtTick_0001
     * @tc.desc      navigatesAtTick(tick=0, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_NavigatesAtTick_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0001 begin`);
      const actual: boolean = navigatesAtTick(0, 0);
      logInfo(`navigatesAtTick(tick=0, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0002
     * @tc.name      WindowStartIcon_NavigatesAtTick_0002
     * @tc.desc      navigatesAtTick(tick=70, initial=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_NavigatesAtTick_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0002 begin`);
      const actual: boolean = navigatesAtTick(70, 70);
      logInfo(`navigatesAtTick(tick=70, initial=70): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}NavigatesAtTick_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0003
     * @tc.name      WindowStartIcon_NavigatesAtTick_0003
     * @tc.desc      navigatesAtTick(tick=-1, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0003 begin`);
      const actual: boolean = navigatesAtTick(-1, 0);
      logInfo(`navigatesAtTick(tick=-1, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0004
     * @tc.name      WindowStartIcon_NavigatesAtTick_0004
     * @tc.desc      navigatesAtTick(tick=1, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0004 begin`);
      const actual: boolean = navigatesAtTick(1, 0);
      logInfo(`navigatesAtTick(tick=1, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0005
     * @tc.name      WindowStartIcon_NavigatesAtTick_0005
     * @tc.desc      navigatesAtTick(tick=2, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0005 begin`);
      const actual: boolean = navigatesAtTick(2, 0);
      logInfo(`navigatesAtTick(tick=2, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0006
     * @tc.name      WindowStartIcon_NavigatesAtTick_0006
     * @tc.desc      navigatesAtTick(tick=3, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0006 begin`);
      const actual: boolean = navigatesAtTick(3, 0);
      logInfo(`navigatesAtTick(tick=3, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0007
     * @tc.name      WindowStartIcon_NavigatesAtTick_0007
     * @tc.desc      navigatesAtTick(tick=10, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0007 begin`);
      const actual: boolean = navigatesAtTick(10, 0);
      logInfo(`navigatesAtTick(tick=10, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0008
     * @tc.name      WindowStartIcon_NavigatesAtTick_0008
     * @tc.desc      navigatesAtTick(tick=100, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0008 begin`);
      const actual: boolean = navigatesAtTick(100, 0);
      logInfo(`navigatesAtTick(tick=100, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0009
     * @tc.name      WindowStartIcon_NavigatesAtTick_0009
     * @tc.desc      navigatesAtTick(tick=5, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0009 begin`);
      const actual: boolean = navigatesAtTick(5, 0);
      logInfo(`navigatesAtTick(tick=5, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0010
     * @tc.name      WindowStartIcon_NavigatesAtTick_0010
     * @tc.desc      navigatesAtTick(tick=15, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0010 begin`);
      const actual: boolean = navigatesAtTick(15, 0);
      logInfo(`navigatesAtTick(tick=15, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0011
     * @tc.name      WindowStartIcon_NavigatesAtTick_0011
     * @tc.desc      navigatesAtTick(tick=20, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0011 begin`);
      const actual: boolean = navigatesAtTick(20, 0);
      logInfo(`navigatesAtTick(tick=20, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0012
     * @tc.name      WindowStartIcon_NavigatesAtTick_0012
     * @tc.desc      navigatesAtTick(tick=25, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0012 begin`);
      const actual: boolean = navigatesAtTick(25, 0);
      logInfo(`navigatesAtTick(tick=25, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0013
     * @tc.name      WindowStartIcon_NavigatesAtTick_0013
     * @tc.desc      navigatesAtTick(tick=30, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0013 begin`);
      const actual: boolean = navigatesAtTick(30, 0);
      logInfo(`navigatesAtTick(tick=30, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0014
     * @tc.name      WindowStartIcon_NavigatesAtTick_0014
     * @tc.desc      navigatesAtTick(tick=35, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0014 begin`);
      const actual: boolean = navigatesAtTick(35, 0);
      logInfo(`navigatesAtTick(tick=35, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0015
     * @tc.name      WindowStartIcon_NavigatesAtTick_0015
     * @tc.desc      navigatesAtTick(tick=40, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0015 begin`);
      const actual: boolean = navigatesAtTick(40, 0);
      logInfo(`navigatesAtTick(tick=40, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0016
     * @tc.name      WindowStartIcon_NavigatesAtTick_0016
     * @tc.desc      navigatesAtTick(tick=45, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0016 begin`);
      const actual: boolean = navigatesAtTick(45, 0);
      logInfo(`navigatesAtTick(tick=45, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0017
     * @tc.name      WindowStartIcon_NavigatesAtTick_0017
     * @tc.desc      navigatesAtTick(tick=50, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0017 begin`);
      const actual: boolean = navigatesAtTick(50, 0);
      logInfo(`navigatesAtTick(tick=50, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0018
     * @tc.name      WindowStartIcon_NavigatesAtTick_0018
     * @tc.desc      navigatesAtTick(tick=55, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0018 begin`);
      const actual: boolean = navigatesAtTick(55, 0);
      logInfo(`navigatesAtTick(tick=55, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0019
     * @tc.name      WindowStartIcon_NavigatesAtTick_0019
     * @tc.desc      navigatesAtTick(tick=60, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0019 begin`);
      const actual: boolean = navigatesAtTick(60, 0);
      logInfo(`navigatesAtTick(tick=60, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0020
     * @tc.name      WindowStartIcon_NavigatesAtTick_0020
     * @tc.desc      navigatesAtTick(tick=65, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0020 begin`);
      const actual: boolean = navigatesAtTick(65, 0);
      logInfo(`navigatesAtTick(tick=65, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0021
     * @tc.name      WindowStartIcon_NavigatesAtTick_0021
     * @tc.desc      navigatesAtTick(tick=70, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0021 begin`);
      const actual: boolean = navigatesAtTick(70, 0);
      logInfo(`navigatesAtTick(tick=70, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0022
     * @tc.name      WindowStartIcon_NavigatesAtTick_0022
     * @tc.desc      navigatesAtTick(tick=75, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0022 begin`);
      const actual: boolean = navigatesAtTick(75, 0);
      logInfo(`navigatesAtTick(tick=75, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0023
     * @tc.name      WindowStartIcon_NavigatesAtTick_0023
     * @tc.desc      navigatesAtTick(tick=80, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0023 begin`);
      const actual: boolean = navigatesAtTick(80, 0);
      logInfo(`navigatesAtTick(tick=80, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0024
     * @tc.name      WindowStartIcon_NavigatesAtTick_0024
     * @tc.desc      navigatesAtTick(tick=85, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0024 begin`);
      const actual: boolean = navigatesAtTick(85, 0);
      logInfo(`navigatesAtTick(tick=85, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0025
     * @tc.name      WindowStartIcon_NavigatesAtTick_0025
     * @tc.desc      navigatesAtTick(tick=90, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0025 begin`);
      const actual: boolean = navigatesAtTick(90, 0);
      logInfo(`navigatesAtTick(tick=90, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0026
     * @tc.name      WindowStartIcon_NavigatesAtTick_0026
     * @tc.desc      navigatesAtTick(tick=95, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0026 begin`);
      const actual: boolean = navigatesAtTick(95, 0);
      logInfo(`navigatesAtTick(tick=95, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0027
     * @tc.name      WindowStartIcon_NavigatesAtTick_0027
     * @tc.desc      navigatesAtTick(tick=105, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0027 begin`);
      const actual: boolean = navigatesAtTick(105, 0);
      logInfo(`navigatesAtTick(tick=105, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0028
     * @tc.name      WindowStartIcon_NavigatesAtTick_0028
     * @tc.desc      navigatesAtTick(tick=110, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0028 begin`);
      const actual: boolean = navigatesAtTick(110, 0);
      logInfo(`navigatesAtTick(tick=110, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0029
     * @tc.name      WindowStartIcon_NavigatesAtTick_0029
     * @tc.desc      navigatesAtTick(tick=115, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0029 begin`);
      const actual: boolean = navigatesAtTick(115, 0);
      logInfo(`navigatesAtTick(tick=115, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0030
     * @tc.name      WindowStartIcon_NavigatesAtTick_0030
     * @tc.desc      navigatesAtTick(tick=120, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0030 begin`);
      const actual: boolean = navigatesAtTick(120, 0);
      logInfo(`navigatesAtTick(tick=120, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0031
     * @tc.name      WindowStartIcon_NavigatesAtTick_0031
     * @tc.desc      navigatesAtTick(tick=125, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0031 begin`);
      const actual: boolean = navigatesAtTick(125, 0);
      logInfo(`navigatesAtTick(tick=125, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0032
     * @tc.name      WindowStartIcon_NavigatesAtTick_0032
     * @tc.desc      navigatesAtTick(tick=130, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0032 begin`);
      const actual: boolean = navigatesAtTick(130, 0);
      logInfo(`navigatesAtTick(tick=130, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0033
     * @tc.name      WindowStartIcon_NavigatesAtTick_0033
     * @tc.desc      navigatesAtTick(tick=135, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0033 begin`);
      const actual: boolean = navigatesAtTick(135, 0);
      logInfo(`navigatesAtTick(tick=135, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0034
     * @tc.name      WindowStartIcon_NavigatesAtTick_0034
     * @tc.desc      navigatesAtTick(tick=140, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0034 begin`);
      const actual: boolean = navigatesAtTick(140, 0);
      logInfo(`navigatesAtTick(tick=140, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0035
     * @tc.name      WindowStartIcon_NavigatesAtTick_0035
     * @tc.desc      navigatesAtTick(tick=145, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0035 begin`);
      const actual: boolean = navigatesAtTick(145, 0);
      logInfo(`navigatesAtTick(tick=145, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0036
     * @tc.name      WindowStartIcon_NavigatesAtTick_0036
     * @tc.desc      navigatesAtTick(tick=150, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0036 begin`);
      const actual: boolean = navigatesAtTick(150, 0);
      logInfo(`navigatesAtTick(tick=150, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0037
     * @tc.name      WindowStartIcon_NavigatesAtTick_0037
     * @tc.desc      navigatesAtTick(tick=155, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0037 begin`);
      const actual: boolean = navigatesAtTick(155, 0);
      logInfo(`navigatesAtTick(tick=155, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0038
     * @tc.name      WindowStartIcon_NavigatesAtTick_0038
     * @tc.desc      navigatesAtTick(tick=160, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0038 begin`);
      const actual: boolean = navigatesAtTick(160, 0);
      logInfo(`navigatesAtTick(tick=160, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0039
     * @tc.name      WindowStartIcon_NavigatesAtTick_0039
     * @tc.desc      navigatesAtTick(tick=165, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0039 begin`);
      const actual: boolean = navigatesAtTick(165, 0);
      logInfo(`navigatesAtTick(tick=165, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0040
     * @tc.name      WindowStartIcon_NavigatesAtTick_0040
     * @tc.desc      navigatesAtTick(tick=170, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0040 begin`);
      const actual: boolean = navigatesAtTick(170, 0);
      logInfo(`navigatesAtTick(tick=170, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0041
     * @tc.name      WindowStartIcon_NavigatesAtTick_0041
     * @tc.desc      navigatesAtTick(tick=175, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0041 begin`);
      const actual: boolean = navigatesAtTick(175, 0);
      logInfo(`navigatesAtTick(tick=175, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0042
     * @tc.name      WindowStartIcon_NavigatesAtTick_0042
     * @tc.desc      navigatesAtTick(tick=180, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0042 begin`);
      const actual: boolean = navigatesAtTick(180, 0);
      logInfo(`navigatesAtTick(tick=180, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0043
     * @tc.name      WindowStartIcon_NavigatesAtTick_0043
     * @tc.desc      navigatesAtTick(tick=185, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0043 begin`);
      const actual: boolean = navigatesAtTick(185, 0);
      logInfo(`navigatesAtTick(tick=185, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0044
     * @tc.name      WindowStartIcon_NavigatesAtTick_0044
     * @tc.desc      navigatesAtTick(tick=190, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0044 begin`);
      const actual: boolean = navigatesAtTick(190, 0);
      logInfo(`navigatesAtTick(tick=190, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0045
     * @tc.name      WindowStartIcon_NavigatesAtTick_0045
     * @tc.desc      navigatesAtTick(tick=195, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0045 begin`);
      const actual: boolean = navigatesAtTick(195, 0);
      logInfo(`navigatesAtTick(tick=195, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0046
     * @tc.name      WindowStartIcon_NavigatesAtTick_0046
     * @tc.desc      navigatesAtTick(tick=200, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_NavigatesAtTick_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0046 begin`);
      const actual: boolean = navigatesAtTick(200, 0);
      logInfo(`navigatesAtTick(tick=200, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0047
     * @tc.name      WindowStartIcon_NavigatesAtTick_0047
     * @tc.desc      navigatesAtTick(tick=-78, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_NavigatesAtTick_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0047 begin`);
      const actual: boolean = navigatesAtTick(-78, 0);
      logInfo(`navigatesAtTick(tick=-78, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0048
     * @tc.name      WindowStartIcon_NavigatesAtTick_0048
     * @tc.desc      navigatesAtTick(tick=-26, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_NavigatesAtTick_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0048 begin`);
      const actual: boolean = navigatesAtTick(-26, 0);
      logInfo(`navigatesAtTick(tick=-26, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0049
     * @tc.name      WindowStartIcon_NavigatesAtTick_0049
     * @tc.desc      navigatesAtTick(tick=-75, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_NavigatesAtTick_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0049 begin`);
      const actual: boolean = navigatesAtTick(-75, 0);
      logInfo(`navigatesAtTick(tick=-75, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_NAVIGATES_AT_TICK_0050
     * @tc.name      WindowStartIcon_NavigatesAtTick_0050
     * @tc.desc      navigatesAtTick(tick=-30, initial=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_NavigatesAtTick_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigatesAtTick_0050 begin`);
      const actual: boolean = navigatesAtTick(-30, 0);
      logInfo(`navigatesAtTick(tick=-30, initial=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NavigatesAtTick_0050 end`);
    });
  });
}
