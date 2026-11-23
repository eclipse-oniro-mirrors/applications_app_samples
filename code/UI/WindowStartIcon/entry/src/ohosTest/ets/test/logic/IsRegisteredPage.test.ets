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
import { isRegisteredPage } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isRegisteredPage (30 cases). */
export default function isRegisteredPageTest(): void {
  describe('IsRegisteredPageTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0001
     * @tc.name      WindowStartIcon_IsRegisteredPage_0001
     * @tc.desc      isRegisteredPage(page="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_IsRegisteredPage_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0001 begin`);
      const actual: boolean = isRegisteredPage('');
      logInfo(`isRegisteredPage(page=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0002
     * @tc.name      WindowStartIcon_IsRegisteredPage_0002
     * @tc.desc      isRegisteredPage(page="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_IsRegisteredPage_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0002 begin`);
      const actual: boolean = isRegisteredPage('a');
      logInfo(`isRegisteredPage(page="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0003
     * @tc.name      WindowStartIcon_IsRegisteredPage_0003
     * @tc.desc      isRegisteredPage(page="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0003 begin`);
      const actual: boolean = isRegisteredPage('abc');
      logInfo(`isRegisteredPage(page="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0004
     * @tc.name      WindowStartIcon_IsRegisteredPage_0004
     * @tc.desc      isRegisteredPage(page="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0004 begin`);
      const actual: boolean = isRegisteredPage('Hello World');
      logInfo(`isRegisteredPage(page="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0005
     * @tc.name      WindowStartIcon_IsRegisteredPage_0005
     * @tc.desc      isRegisteredPage(page=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0005 begin`);
      const actual: boolean = isRegisteredPage(' ');
      logInfo(`isRegisteredPage(page=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0006
     * @tc.name      WindowStartIcon_IsRegisteredPage_0006
     * @tc.desc      isRegisteredPage(page="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0006 begin`);
      const actual: boolean = isRegisteredPage('123');
      logInfo(`isRegisteredPage(page="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0007
     * @tc.name      WindowStartIcon_IsRegisteredPage_0007
     * @tc.desc      isRegisteredPage(page=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0007 begin`);
      const actual: boolean = isRegisteredPage(' a ');
      logInfo(`isRegisteredPage(page=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0008
     * @tc.name      WindowStartIcon_IsRegisteredPage_0008
     * @tc.desc      isRegisteredPage(page="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0008 begin`);
      const actual: boolean = isRegisteredPage('aa');
      logInfo(`isRegisteredPage(page="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0009
     * @tc.name      WindowStartIcon_IsRegisteredPage_0009
     * @tc.desc      isRegisteredPage(page="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0009 begin`);
      const actual: boolean = isRegisteredPage('a_1');
      logInfo(`isRegisteredPage(page="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0010
     * @tc.name      WindowStartIcon_IsRegisteredPage_0010
     * @tc.desc      isRegisteredPage(page="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0010 begin`);
      const actual: boolean = isRegisteredPage('xa');
      logInfo(`isRegisteredPage(page="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0011
     * @tc.name      WindowStartIcon_IsRegisteredPage_0011
     * @tc.desc      isRegisteredPage(page=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0011 begin`);
      const actual: boolean = isRegisteredPage(' abc ');
      logInfo(`isRegisteredPage(page=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0012
     * @tc.name      WindowStartIcon_IsRegisteredPage_0012
     * @tc.desc      isRegisteredPage(page="abcabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0012 begin`);
      const actual: boolean = isRegisteredPage('abcabc');
      logInfo(`isRegisteredPage(page="abcabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0013
     * @tc.name      WindowStartIcon_IsRegisteredPage_0013
     * @tc.desc      isRegisteredPage(page="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0013 begin`);
      const actual: boolean = isRegisteredPage('abc_1');
      logInfo(`isRegisteredPage(page="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0014
     * @tc.name      WindowStartIcon_IsRegisteredPage_0014
     * @tc.desc      isRegisteredPage(page="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0014 begin`);
      const actual: boolean = isRegisteredPage('xabc');
      logInfo(`isRegisteredPage(page="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0015
     * @tc.name      WindowStartIcon_IsRegisteredPage_0015
     * @tc.desc      isRegisteredPage(page=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0015 begin`);
      const actual: boolean = isRegisteredPage(' Hello World ');
      logInfo(`isRegisteredPage(page=" Hello World "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0016
     * @tc.name      WindowStartIcon_IsRegisteredPage_0016
     * @tc.desc      isRegisteredPage(page="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0016 begin`);
      const actual: boolean = isRegisteredPage('Hello WorldHello World');
      logInfo(`isRegisteredPage(page="Hello WorldHello W...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0017
     * @tc.name      WindowStartIcon_IsRegisteredPage_0017
     * @tc.desc      isRegisteredPage(page="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0017 begin`);
      const actual: boolean = isRegisteredPage('Hello World_1');
      logInfo(`isRegisteredPage(page="Hello World_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0018
     * @tc.name      WindowStartIcon_IsRegisteredPage_0018
     * @tc.desc      isRegisteredPage(page="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0018 begin`);
      const actual: boolean = isRegisteredPage('xHello World');
      logInfo(`isRegisteredPage(page="xHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0019
     * @tc.name      WindowStartIcon_IsRegisteredPage_0019
     * @tc.desc      isRegisteredPage(page="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0019 begin`);
      const actual: boolean = isRegisteredPage('   ');
      logInfo(`isRegisteredPage(page="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0020
     * @tc.name      WindowStartIcon_IsRegisteredPage_0020
     * @tc.desc      isRegisteredPage(page="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0020 begin`);
      const actual: boolean = isRegisteredPage('  ');
      logInfo(`isRegisteredPage(page="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0021
     * @tc.name      WindowStartIcon_IsRegisteredPage_0021
     * @tc.desc      isRegisteredPage(page=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0021 begin`);
      const actual: boolean = isRegisteredPage(' _1');
      logInfo(`isRegisteredPage(page=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0022
     * @tc.name      WindowStartIcon_IsRegisteredPage_0022
     * @tc.desc      isRegisteredPage(page="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0022 begin`);
      const actual: boolean = isRegisteredPage('x ');
      logInfo(`isRegisteredPage(page="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0023
     * @tc.name      WindowStartIcon_IsRegisteredPage_0023
     * @tc.desc      isRegisteredPage(page=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0023 begin`);
      const actual: boolean = isRegisteredPage(' 123 ');
      logInfo(`isRegisteredPage(page=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0024
     * @tc.name      WindowStartIcon_IsRegisteredPage_0024
     * @tc.desc      isRegisteredPage(page="123123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0024 begin`);
      const actual: boolean = isRegisteredPage('123123');
      logInfo(`isRegisteredPage(page="123123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0025
     * @tc.name      WindowStartIcon_IsRegisteredPage_0025
     * @tc.desc      isRegisteredPage(page="123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0025 begin`);
      const actual: boolean = isRegisteredPage('123_1');
      logInfo(`isRegisteredPage(page="123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0026
     * @tc.name      WindowStartIcon_IsRegisteredPage_0026
     * @tc.desc      isRegisteredPage(page="x123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_IsRegisteredPage_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0026 begin`);
      const actual: boolean = isRegisteredPage('x123');
      logInfo(`isRegisteredPage(page="x123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0027
     * @tc.name      WindowStartIcon_IsRegisteredPage_0027
     * @tc.desc      isRegisteredPage(page="EkR") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0027 begin`);
      const actual: boolean = isRegisteredPage('EkR');
      logInfo(`isRegisteredPage(page="EkR"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0028
     * @tc.name      WindowStartIcon_IsRegisteredPage_0028
     * @tc.desc      isRegisteredPage(page="I") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0028 begin`);
      const actual: boolean = isRegisteredPage('I');
      logInfo(`isRegisteredPage(page="I"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0029
     * @tc.name      WindowStartIcon_IsRegisteredPage_0029
     * @tc.desc      isRegisteredPage(page="w6oc0U") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0029 begin`);
      const actual: boolean = isRegisteredPage('w6oc0U');
      logInfo(`isRegisteredPage(page="w6oc0U"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_IS_REGISTERED_PAGE_0030
     * @tc.name      WindowStartIcon_IsRegisteredPage_0030
     * @tc.desc      isRegisteredPage(page="eUKeBdlv") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_IsRegisteredPage_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsRegisteredPage_0030 begin`);
      const actual: boolean = isRegisteredPage('eUKeBdlv');
      logInfo(`isRegisteredPage(page="eUKeBdlv"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsRegisteredPage_0030 end`);
    });
  });
}
