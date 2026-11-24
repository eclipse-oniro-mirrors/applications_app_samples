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
import { isHexColor } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isHexColor (30 cases). */
export default function isHexColorTest(): void {
  describe('IsHexColorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0001
     * @tc.name      WindowStartIcon_IsHexColor_0001
     * @tc.desc      isHexColor(color="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_IsHexColor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHexColor_0001 begin`);
      const actual: boolean = isHexColor('');
      logInfo(`isHexColor(color=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0002
     * @tc.name      WindowStartIcon_IsHexColor_0002
     * @tc.desc      isHexColor(color="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_IsHexColor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHexColor_0002 begin`);
      const actual: boolean = isHexColor('a');
      logInfo(`isHexColor(color="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0003
     * @tc.name      WindowStartIcon_IsHexColor_0003
     * @tc.desc      isHexColor(color="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0003 begin`);
      const actual: boolean = isHexColor('abc');
      logInfo(`isHexColor(color="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0004
     * @tc.name      WindowStartIcon_IsHexColor_0004
     * @tc.desc      isHexColor(color="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0004 begin`);
      const actual: boolean = isHexColor('Hello World');
      logInfo(`isHexColor(color="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0005
     * @tc.name      WindowStartIcon_IsHexColor_0005
     * @tc.desc      isHexColor(color=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0005 begin`);
      const actual: boolean = isHexColor(' ');
      logInfo(`isHexColor(color=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0006
     * @tc.name      WindowStartIcon_IsHexColor_0006
     * @tc.desc      isHexColor(color="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0006 begin`);
      const actual: boolean = isHexColor('123');
      logInfo(`isHexColor(color="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0007
     * @tc.name      WindowStartIcon_IsHexColor_0007
     * @tc.desc      isHexColor(color=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0007 begin`);
      const actual: boolean = isHexColor(' a ');
      logInfo(`isHexColor(color=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0008
     * @tc.name      WindowStartIcon_IsHexColor_0008
     * @tc.desc      isHexColor(color="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0008 begin`);
      const actual: boolean = isHexColor('aa');
      logInfo(`isHexColor(color="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0009
     * @tc.name      WindowStartIcon_IsHexColor_0009
     * @tc.desc      isHexColor(color="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0009 begin`);
      const actual: boolean = isHexColor('a_1');
      logInfo(`isHexColor(color="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0010
     * @tc.name      WindowStartIcon_IsHexColor_0010
     * @tc.desc      isHexColor(color="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0010 begin`);
      const actual: boolean = isHexColor('xa');
      logInfo(`isHexColor(color="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0011
     * @tc.name      WindowStartIcon_IsHexColor_0011
     * @tc.desc      isHexColor(color=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0011 begin`);
      const actual: boolean = isHexColor(' abc ');
      logInfo(`isHexColor(color=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0012
     * @tc.name      WindowStartIcon_IsHexColor_0012
     * @tc.desc      isHexColor(color="abcabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0012 begin`);
      const actual: boolean = isHexColor('abcabc');
      logInfo(`isHexColor(color="abcabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0013
     * @tc.name      WindowStartIcon_IsHexColor_0013
     * @tc.desc      isHexColor(color="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0013 begin`);
      const actual: boolean = isHexColor('abc_1');
      logInfo(`isHexColor(color="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0014
     * @tc.name      WindowStartIcon_IsHexColor_0014
     * @tc.desc      isHexColor(color="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0014 begin`);
      const actual: boolean = isHexColor('xabc');
      logInfo(`isHexColor(color="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0015
     * @tc.name      WindowStartIcon_IsHexColor_0015
     * @tc.desc      isHexColor(color=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0015 begin`);
      const actual: boolean = isHexColor(' Hello World ');
      logInfo(`isHexColor(color=" Hello World "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0016
     * @tc.name      WindowStartIcon_IsHexColor_0016
     * @tc.desc      isHexColor(color="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0016 begin`);
      const actual: boolean = isHexColor('Hello WorldHello World');
      logInfo(`isHexColor(color="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0017
     * @tc.name      WindowStartIcon_IsHexColor_0017
     * @tc.desc      isHexColor(color="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0017 begin`);
      const actual: boolean = isHexColor('Hello World_1');
      logInfo(`isHexColor(color="Hello World_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0018
     * @tc.name      WindowStartIcon_IsHexColor_0018
     * @tc.desc      isHexColor(color="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0018 begin`);
      const actual: boolean = isHexColor('xHello World');
      logInfo(`isHexColor(color="xHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0019
     * @tc.name      WindowStartIcon_IsHexColor_0019
     * @tc.desc      isHexColor(color="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0019 begin`);
      const actual: boolean = isHexColor('   ');
      logInfo(`isHexColor(color="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0020
     * @tc.name      WindowStartIcon_IsHexColor_0020
     * @tc.desc      isHexColor(color="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0020 begin`);
      const actual: boolean = isHexColor('  ');
      logInfo(`isHexColor(color="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0021
     * @tc.name      WindowStartIcon_IsHexColor_0021
     * @tc.desc      isHexColor(color=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0021 begin`);
      const actual: boolean = isHexColor(' _1');
      logInfo(`isHexColor(color=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0022
     * @tc.name      WindowStartIcon_IsHexColor_0022
     * @tc.desc      isHexColor(color="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0022 begin`);
      const actual: boolean = isHexColor('x ');
      logInfo(`isHexColor(color="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0023
     * @tc.name      WindowStartIcon_IsHexColor_0023
     * @tc.desc      isHexColor(color=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0023 begin`);
      const actual: boolean = isHexColor(' 123 ');
      logInfo(`isHexColor(color=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0024
     * @tc.name      WindowStartIcon_IsHexColor_0024
     * @tc.desc      isHexColor(color="123123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0024 begin`);
      const actual: boolean = isHexColor('123123');
      logInfo(`isHexColor(color="123123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0025
     * @tc.name      WindowStartIcon_IsHexColor_0025
     * @tc.desc      isHexColor(color="123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0025 begin`);
      const actual: boolean = isHexColor('123_1');
      logInfo(`isHexColor(color="123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0026
     * @tc.name      WindowStartIcon_IsHexColor_0026
     * @tc.desc      isHexColor(color="x123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsHexColor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHexColor_0026 begin`);
      const actual: boolean = isHexColor('x123');
      logInfo(`isHexColor(color="x123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0027
     * @tc.name      WindowStartIcon_IsHexColor_0027
     * @tc.desc      isHexColor(color="TEet") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0027 begin`);
      const actual: boolean = isHexColor('TEet');
      logInfo(`isHexColor(color="TEet"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0028
     * @tc.name      WindowStartIcon_IsHexColor_0028
     * @tc.desc      isHexColor(color="zqQmqSqbD8Z3") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0028 begin`);
      const actual: boolean = isHexColor('zqQmqSqbD8Z3');
      logInfo(`isHexColor(color="zqQmqSqbD8Z3"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0029
     * @tc.name      WindowStartIcon_IsHexColor_0029
     * @tc.desc      isHexColor(color="UPfTC") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0029 begin`);
      const actual: boolean = isHexColor('UPfTC');
      logInfo(`isHexColor(color="UPfTC"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_HEX_COLOR_0030
     * @tc.name      WindowStartIcon_IsHexColor_0030
     * @tc.desc      isHexColor(color="mW7mFnmJC") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsHexColor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHexColor_0030 begin`);
      const actual: boolean = isHexColor('mW7mFnmJC');
      logInfo(`isHexColor(color="mW7mFnmJC"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHexColor_0030 end`);
    });
  });
}
