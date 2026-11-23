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
import { fullScreenFor } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for fullScreenFor (50 cases). */
export default function fullScreenForTest(): void {
  describe('FullScreenForTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0001
     * @tc.name      WindowStartIcon_FullScreenFor_0001
     * @tc.desc      fullScreenFor(event="show") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_FullScreenFor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FullScreenFor_0001 begin`);
      const actual: boolean = fullScreenFor('show');
      logInfo(`fullScreenFor(event="show"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}FullScreenFor_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0002
     * @tc.name      WindowStartIcon_FullScreenFor_0002
     * @tc.desc      fullScreenFor(event="SHOW") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_FullScreenFor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FullScreenFor_0002 begin`);
      const actual: boolean = fullScreenFor('SHOW');
      logInfo(`fullScreenFor(event="SHOW"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0003
     * @tc.name      WindowStartIcon_FullScreenFor_0003
     * @tc.desc      fullScreenFor(event="sho") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0003 begin`);
      const actual: boolean = fullScreenFor('sho');
      logInfo(`fullScreenFor(event="sho"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0004
     * @tc.name      WindowStartIcon_FullScreenFor_0004
     * @tc.desc      fullScreenFor(event="showx") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0004 begin`);
      const actual: boolean = fullScreenFor('showx');
      logInfo(`fullScreenFor(event="showx"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0005
     * @tc.name      WindowStartIcon_FullScreenFor_0005
     * @tc.desc      fullScreenFor(event="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0005 begin`);
      const actual: boolean = fullScreenFor('');
      logInfo(`fullScreenFor(event=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0006
     * @tc.name      WindowStartIcon_FullScreenFor_0006
     * @tc.desc      fullScreenFor(event="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0006 begin`);
      const actual: boolean = fullScreenFor('a');
      logInfo(`fullScreenFor(event="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0007
     * @tc.name      WindowStartIcon_FullScreenFor_0007
     * @tc.desc      fullScreenFor(event="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0007 begin`);
      const actual: boolean = fullScreenFor('abc');
      logInfo(`fullScreenFor(event="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0008
     * @tc.name      WindowStartIcon_FullScreenFor_0008
     * @tc.desc      fullScreenFor(event="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0008 begin`);
      const actual: boolean = fullScreenFor('Hello World');
      logInfo(`fullScreenFor(event="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0009
     * @tc.name      WindowStartIcon_FullScreenFor_0009
     * @tc.desc      fullScreenFor(event=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0009 begin`);
      const actual: boolean = fullScreenFor(' ');
      logInfo(`fullScreenFor(event=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0010
     * @tc.name      WindowStartIcon_FullScreenFor_0010
     * @tc.desc      fullScreenFor(event="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0010 begin`);
      const actual: boolean = fullScreenFor('123');
      logInfo(`fullScreenFor(event="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0011
     * @tc.name      WindowStartIcon_FullScreenFor_0011
     * @tc.desc      fullScreenFor(event=" show ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0011 begin`);
      const actual: boolean = fullScreenFor(' show ');
      logInfo(`fullScreenFor(event=" show "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0012
     * @tc.name      WindowStartIcon_FullScreenFor_0012
     * @tc.desc      fullScreenFor(event="showshow") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0012 begin`);
      const actual: boolean = fullScreenFor('showshow');
      logInfo(`fullScreenFor(event="showshow"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0013
     * @tc.name      WindowStartIcon_FullScreenFor_0013
     * @tc.desc      fullScreenFor(event="show_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0013 begin`);
      const actual: boolean = fullScreenFor('show_1');
      logInfo(`fullScreenFor(event="show_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0014
     * @tc.name      WindowStartIcon_FullScreenFor_0014
     * @tc.desc      fullScreenFor(event="xshow") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0014 begin`);
      const actual: boolean = fullScreenFor('xshow');
      logInfo(`fullScreenFor(event="xshow"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0015
     * @tc.name      WindowStartIcon_FullScreenFor_0015
     * @tc.desc      fullScreenFor(event=" SHOW ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0015 begin`);
      const actual: boolean = fullScreenFor(' SHOW ');
      logInfo(`fullScreenFor(event=" SHOW "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0016
     * @tc.name      WindowStartIcon_FullScreenFor_0016
     * @tc.desc      fullScreenFor(event="SHOWSHOW") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0016 begin`);
      const actual: boolean = fullScreenFor('SHOWSHOW');
      logInfo(`fullScreenFor(event="SHOWSHOW"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0017
     * @tc.name      WindowStartIcon_FullScreenFor_0017
     * @tc.desc      fullScreenFor(event="SHOW_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0017 begin`);
      const actual: boolean = fullScreenFor('SHOW_1');
      logInfo(`fullScreenFor(event="SHOW_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0018
     * @tc.name      WindowStartIcon_FullScreenFor_0018
     * @tc.desc      fullScreenFor(event="xSHOW") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0018 begin`);
      const actual: boolean = fullScreenFor('xSHOW');
      logInfo(`fullScreenFor(event="xSHOW"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0019
     * @tc.name      WindowStartIcon_FullScreenFor_0019
     * @tc.desc      fullScreenFor(event=" sho ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0019 begin`);
      const actual: boolean = fullScreenFor(' sho ');
      logInfo(`fullScreenFor(event=" sho "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0020
     * @tc.name      WindowStartIcon_FullScreenFor_0020
     * @tc.desc      fullScreenFor(event="shosho") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0020 begin`);
      const actual: boolean = fullScreenFor('shosho');
      logInfo(`fullScreenFor(event="shosho"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0021
     * @tc.name      WindowStartIcon_FullScreenFor_0021
     * @tc.desc      fullScreenFor(event="sho_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0021 begin`);
      const actual: boolean = fullScreenFor('sho_1');
      logInfo(`fullScreenFor(event="sho_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0022
     * @tc.name      WindowStartIcon_FullScreenFor_0022
     * @tc.desc      fullScreenFor(event="xsho") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0022 begin`);
      const actual: boolean = fullScreenFor('xsho');
      logInfo(`fullScreenFor(event="xsho"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0023
     * @tc.name      WindowStartIcon_FullScreenFor_0023
     * @tc.desc      fullScreenFor(event=" showx ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0023 begin`);
      const actual: boolean = fullScreenFor(' showx ');
      logInfo(`fullScreenFor(event=" showx "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0024
     * @tc.name      WindowStartIcon_FullScreenFor_0024
     * @tc.desc      fullScreenFor(event="showxshowx") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0024 begin`);
      const actual: boolean = fullScreenFor('showxshowx');
      logInfo(`fullScreenFor(event="showxshowx"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0025
     * @tc.name      WindowStartIcon_FullScreenFor_0025
     * @tc.desc      fullScreenFor(event="showx_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0025 begin`);
      const actual: boolean = fullScreenFor('showx_1');
      logInfo(`fullScreenFor(event="showx_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0026
     * @tc.name      WindowStartIcon_FullScreenFor_0026
     * @tc.desc      fullScreenFor(event="xshowx") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0026 begin`);
      const actual: boolean = fullScreenFor('xshowx');
      logInfo(`fullScreenFor(event="xshowx"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0027
     * @tc.name      WindowStartIcon_FullScreenFor_0027
     * @tc.desc      fullScreenFor(event=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0027 begin`);
      const actual: boolean = fullScreenFor(' a ');
      logInfo(`fullScreenFor(event=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0028
     * @tc.name      WindowStartIcon_FullScreenFor_0028
     * @tc.desc      fullScreenFor(event="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0028 begin`);
      const actual: boolean = fullScreenFor('aa');
      logInfo(`fullScreenFor(event="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0029
     * @tc.name      WindowStartIcon_FullScreenFor_0029
     * @tc.desc      fullScreenFor(event="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0029 begin`);
      const actual: boolean = fullScreenFor('a_1');
      logInfo(`fullScreenFor(event="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0030
     * @tc.name      WindowStartIcon_FullScreenFor_0030
     * @tc.desc      fullScreenFor(event="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0030 begin`);
      const actual: boolean = fullScreenFor('xa');
      logInfo(`fullScreenFor(event="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0031
     * @tc.name      WindowStartIcon_FullScreenFor_0031
     * @tc.desc      fullScreenFor(event=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0031 begin`);
      const actual: boolean = fullScreenFor(' abc ');
      logInfo(`fullScreenFor(event=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0032
     * @tc.name      WindowStartIcon_FullScreenFor_0032
     * @tc.desc      fullScreenFor(event="abcabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0032 begin`);
      const actual: boolean = fullScreenFor('abcabc');
      logInfo(`fullScreenFor(event="abcabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0033
     * @tc.name      WindowStartIcon_FullScreenFor_0033
     * @tc.desc      fullScreenFor(event="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0033 begin`);
      const actual: boolean = fullScreenFor('abc_1');
      logInfo(`fullScreenFor(event="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0034
     * @tc.name      WindowStartIcon_FullScreenFor_0034
     * @tc.desc      fullScreenFor(event="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0034 begin`);
      const actual: boolean = fullScreenFor('xabc');
      logInfo(`fullScreenFor(event="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0035
     * @tc.name      WindowStartIcon_FullScreenFor_0035
     * @tc.desc      fullScreenFor(event=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0035 begin`);
      const actual: boolean = fullScreenFor(' Hello World ');
      logInfo(`fullScreenFor(event=" Hello World "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0036
     * @tc.name      WindowStartIcon_FullScreenFor_0036
     * @tc.desc      fullScreenFor(event="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0036 begin`);
      const actual: boolean = fullScreenFor('Hello WorldHello World');
      logInfo(`fullScreenFor(event="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0037
     * @tc.name      WindowStartIcon_FullScreenFor_0037
     * @tc.desc      fullScreenFor(event="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0037 begin`);
      const actual: boolean = fullScreenFor('Hello World_1');
      logInfo(`fullScreenFor(event="Hello World_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0038
     * @tc.name      WindowStartIcon_FullScreenFor_0038
     * @tc.desc      fullScreenFor(event="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0038 begin`);
      const actual: boolean = fullScreenFor('xHello World');
      logInfo(`fullScreenFor(event="xHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0039
     * @tc.name      WindowStartIcon_FullScreenFor_0039
     * @tc.desc      fullScreenFor(event="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0039 begin`);
      const actual: boolean = fullScreenFor('   ');
      logInfo(`fullScreenFor(event="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0040
     * @tc.name      WindowStartIcon_FullScreenFor_0040
     * @tc.desc      fullScreenFor(event="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0040 begin`);
      const actual: boolean = fullScreenFor('  ');
      logInfo(`fullScreenFor(event="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0041
     * @tc.name      WindowStartIcon_FullScreenFor_0041
     * @tc.desc      fullScreenFor(event=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0041 begin`);
      const actual: boolean = fullScreenFor(' _1');
      logInfo(`fullScreenFor(event=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0042
     * @tc.name      WindowStartIcon_FullScreenFor_0042
     * @tc.desc      fullScreenFor(event="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0042 begin`);
      const actual: boolean = fullScreenFor('x ');
      logInfo(`fullScreenFor(event="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0043
     * @tc.name      WindowStartIcon_FullScreenFor_0043
     * @tc.desc      fullScreenFor(event=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0043 begin`);
      const actual: boolean = fullScreenFor(' 123 ');
      logInfo(`fullScreenFor(event=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0044
     * @tc.name      WindowStartIcon_FullScreenFor_0044
     * @tc.desc      fullScreenFor(event="123123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0044 begin`);
      const actual: boolean = fullScreenFor('123123');
      logInfo(`fullScreenFor(event="123123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0045
     * @tc.name      WindowStartIcon_FullScreenFor_0045
     * @tc.desc      fullScreenFor(event="123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0045 begin`);
      const actual: boolean = fullScreenFor('123_1');
      logInfo(`fullScreenFor(event="123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0046
     * @tc.name      WindowStartIcon_FullScreenFor_0046
     * @tc.desc      fullScreenFor(event="x123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_FullScreenFor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FullScreenFor_0046 begin`);
      const actual: boolean = fullScreenFor('x123');
      logInfo(`fullScreenFor(event="x123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0047
     * @tc.name      WindowStartIcon_FullScreenFor_0047
     * @tc.desc      fullScreenFor(event="s8H97") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0047 begin`);
      const actual: boolean = fullScreenFor('s8H97');
      logInfo(`fullScreenFor(event="s8H97"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0048
     * @tc.name      WindowStartIcon_FullScreenFor_0048
     * @tc.desc      fullScreenFor(event="MgYhRV") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0048 begin`);
      const actual: boolean = fullScreenFor('MgYhRV');
      logInfo(`fullScreenFor(event="MgYhRV"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0049
     * @tc.name      WindowStartIcon_FullScreenFor_0049
     * @tc.desc      fullScreenFor(event="W") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0049 begin`);
      const actual: boolean = fullScreenFor('W');
      logInfo(`fullScreenFor(event="W"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_FULL_SCREEN_FOR_0050
     * @tc.name      WindowStartIcon_FullScreenFor_0050
     * @tc.desc      fullScreenFor(event="2B") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_FullScreenFor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FullScreenFor_0050 begin`);
      const actual: boolean = fullScreenFor('2B');
      logInfo(`fullScreenFor(event="2B"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FullScreenFor_0050 end`);
    });
  });
}
