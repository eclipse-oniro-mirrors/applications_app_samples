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
import { colorChannelOf } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for colorChannelOf (30 cases). */
export default function colorChannelOfTest(): void {
  describe('ColorChannelOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0001
     * @tc.name      WindowStartIcon_ColorChannelOf_0001
     * @tc.desc      colorChannelOf(color="", channel=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_ColorChannelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0001 begin`);
      const actual: number = colorChannelOf('', 0);
      logInfo(`colorChannelOf(color="", channel=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0002
     * @tc.name      WindowStartIcon_ColorChannelOf_0002
     * @tc.desc      colorChannelOf(color="", channel=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_ColorChannelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0002 begin`);
      const actual: number = colorChannelOf('', -1);
      logInfo(`colorChannelOf(color="", channel=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0003
     * @tc.name      WindowStartIcon_ColorChannelOf_0003
     * @tc.desc      colorChannelOf(color="", channel=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0003 begin`);
      const actual: number = colorChannelOf('', 1);
      logInfo(`colorChannelOf(color="", channel=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0004
     * @tc.name      WindowStartIcon_ColorChannelOf_0004
     * @tc.desc      colorChannelOf(color="", channel=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0004 begin`);
      const actual: number = colorChannelOf('', 2);
      logInfo(`colorChannelOf(color="", channel=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0005
     * @tc.name      WindowStartIcon_ColorChannelOf_0005
     * @tc.desc      colorChannelOf(color="", channel=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0005 begin`);
      const actual: number = colorChannelOf('', 3);
      logInfo(`colorChannelOf(color="", channel=3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0006
     * @tc.name      WindowStartIcon_ColorChannelOf_0006
     * @tc.desc      colorChannelOf(color="", channel=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0006 begin`);
      const actual: number = colorChannelOf('', -2);
      logInfo(`colorChannelOf(color="", channel=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0007
     * @tc.name      WindowStartIcon_ColorChannelOf_0007
     * @tc.desc      colorChannelOf(color="", channel=9) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0007 begin`);
      const actual: number = colorChannelOf('', 9);
      logInfo(`colorChannelOf(color="", channel=9): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0008
     * @tc.name      WindowStartIcon_ColorChannelOf_0008
     * @tc.desc      colorChannelOf(color="", channel=8) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0008 begin`);
      const actual: number = colorChannelOf('', 8);
      logInfo(`colorChannelOf(color="", channel=8): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0009
     * @tc.name      WindowStartIcon_ColorChannelOf_0009
     * @tc.desc      colorChannelOf(color="", channel=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0009 begin`);
      const actual: number = colorChannelOf('', 10);
      logInfo(`colorChannelOf(color="", channel=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0010
     * @tc.name      WindowStartIcon_ColorChannelOf_0010
     * @tc.desc      colorChannelOf(color="", channel=4) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0010 begin`);
      const actual: number = colorChannelOf('', 4);
      logInfo(`colorChannelOf(color="", channel=4): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0011
     * @tc.name      WindowStartIcon_ColorChannelOf_0011
     * @tc.desc      colorChannelOf(color="", channel=16) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0011 begin`);
      const actual: number = colorChannelOf('', 16);
      logInfo(`colorChannelOf(color="", channel=16): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0012
     * @tc.name      WindowStartIcon_ColorChannelOf_0012
     * @tc.desc      colorChannelOf(color="", channel=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0012 begin`);
      const actual: number = colorChannelOf('', 15);
      logInfo(`colorChannelOf(color="", channel=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0013
     * @tc.name      WindowStartIcon_ColorChannelOf_0013
     * @tc.desc      colorChannelOf(color="", channel=17) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0013 begin`);
      const actual: number = colorChannelOf('', 17);
      logInfo(`colorChannelOf(color="", channel=17): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0014
     * @tc.name      WindowStartIcon_ColorChannelOf_0014
     * @tc.desc      colorChannelOf(color="", channel=32) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0014 begin`);
      const actual: number = colorChannelOf('', 32);
      logInfo(`colorChannelOf(color="", channel=32): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0015
     * @tc.name      WindowStartIcon_ColorChannelOf_0015
     * @tc.desc      colorChannelOf(color="", channel=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0015 begin`);
      const actual: number = colorChannelOf('', 100);
      logInfo(`colorChannelOf(color="", channel=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0016
     * @tc.name      WindowStartIcon_ColorChannelOf_0016
     * @tc.desc      colorChannelOf(color="", channel=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0016 begin`);
      const actual: number = colorChannelOf('', 5);
      logInfo(`colorChannelOf(color="", channel=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0017
     * @tc.name      WindowStartIcon_ColorChannelOf_0017
     * @tc.desc      colorChannelOf(color="", channel=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0017 begin`);
      const actual: number = colorChannelOf('', 20);
      logInfo(`colorChannelOf(color="", channel=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0018
     * @tc.name      WindowStartIcon_ColorChannelOf_0018
     * @tc.desc      colorChannelOf(color="", channel=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0018 begin`);
      const actual: number = colorChannelOf('', 25);
      logInfo(`colorChannelOf(color="", channel=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0019
     * @tc.name      WindowStartIcon_ColorChannelOf_0019
     * @tc.desc      colorChannelOf(color="", channel=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0019 begin`);
      const actual: number = colorChannelOf('', 30);
      logInfo(`colorChannelOf(color="", channel=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0020
     * @tc.name      WindowStartIcon_ColorChannelOf_0020
     * @tc.desc      colorChannelOf(color="", channel=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0020 begin`);
      const actual: number = colorChannelOf('', 35);
      logInfo(`colorChannelOf(color="", channel=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0021
     * @tc.name      WindowStartIcon_ColorChannelOf_0021
     * @tc.desc      colorChannelOf(color="", channel=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0021 begin`);
      const actual: number = colorChannelOf('', 40);
      logInfo(`colorChannelOf(color="", channel=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0022
     * @tc.name      WindowStartIcon_ColorChannelOf_0022
     * @tc.desc      colorChannelOf(color="", channel=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0022 begin`);
      const actual: number = colorChannelOf('', 45);
      logInfo(`colorChannelOf(color="", channel=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0023
     * @tc.name      WindowStartIcon_ColorChannelOf_0023
     * @tc.desc      colorChannelOf(color="", channel=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0023 begin`);
      const actual: number = colorChannelOf('', 50);
      logInfo(`colorChannelOf(color="", channel=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0024
     * @tc.name      WindowStartIcon_ColorChannelOf_0024
     * @tc.desc      colorChannelOf(color="", channel=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0024 begin`);
      const actual: number = colorChannelOf('', 55);
      logInfo(`colorChannelOf(color="", channel=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0025
     * @tc.name      WindowStartIcon_ColorChannelOf_0025
     * @tc.desc      colorChannelOf(color="", channel=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0025 begin`);
      const actual: number = colorChannelOf('', 60);
      logInfo(`colorChannelOf(color="", channel=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0026
     * @tc.name      WindowStartIcon_ColorChannelOf_0026
     * @tc.desc      colorChannelOf(color="", channel=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0026 begin`);
      const actual: number = colorChannelOf('', 65);
      logInfo(`colorChannelOf(color="", channel=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0027
     * @tc.name      WindowStartIcon_ColorChannelOf_0027
     * @tc.desc      colorChannelOf(color="", channel=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0027 begin`);
      const actual: number = colorChannelOf('', 70);
      logInfo(`colorChannelOf(color="", channel=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0028
     * @tc.name      WindowStartIcon_ColorChannelOf_0028
     * @tc.desc      colorChannelOf(color="", channel=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0028 begin`);
      const actual: number = colorChannelOf('', 75);
      logInfo(`colorChannelOf(color="", channel=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0029
     * @tc.name      WindowStartIcon_ColorChannelOf_0029
     * @tc.desc      colorChannelOf(color="", channel=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0029 begin`);
      const actual: number = colorChannelOf('', 80);
      logInfo(`colorChannelOf(color="", channel=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COLOR_CHANNEL_OF_0030
     * @tc.name      WindowStartIcon_ColorChannelOf_0030
     * @tc.desc      colorChannelOf(color="", channel=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ColorChannelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColorChannelOf_0030 begin`);
      const actual: number = colorChannelOf('', 85);
      logInfo(`colorChannelOf(color="", channel=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ColorChannelOf_0030 end`);
    });
  });
}
