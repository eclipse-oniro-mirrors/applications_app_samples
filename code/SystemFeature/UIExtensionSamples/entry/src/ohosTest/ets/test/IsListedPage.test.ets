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
import { isListedPage } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isListedPage (30 cases). */
export default function isListedPageTest(): void {
  describe('IsListedPageTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0001
     * @tc.name      UIExtensionSamples_IsListedPage_0001
     * @tc.desc      isListedPage(item="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_IsListedPage_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsListedPage_0001 begin`);
      const actual: boolean = isListedPage('');
      logInfo(`isListedPage(item=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0002
     * @tc.name      UIExtensionSamples_IsListedPage_0002
     * @tc.desc      isListedPage(item="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_IsListedPage_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsListedPage_0002 begin`);
      const actual: boolean = isListedPage('a');
      logInfo(`isListedPage(item="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0003
     * @tc.name      UIExtensionSamples_IsListedPage_0003
     * @tc.desc      isListedPage(item="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0003 begin`);
      const actual: boolean = isListedPage('abc');
      logInfo(`isListedPage(item="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0004
     * @tc.name      UIExtensionSamples_IsListedPage_0004
     * @tc.desc      isListedPage(item="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0004 begin`);
      const actual: boolean = isListedPage('Hello World');
      logInfo(`isListedPage(item="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0005
     * @tc.name      UIExtensionSamples_IsListedPage_0005
     * @tc.desc      isListedPage(item=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0005 begin`);
      const actual: boolean = isListedPage(' ');
      logInfo(`isListedPage(item=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0006
     * @tc.name      UIExtensionSamples_IsListedPage_0006
     * @tc.desc      isListedPage(item="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0006 begin`);
      const actual: boolean = isListedPage('123');
      logInfo(`isListedPage(item="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0007
     * @tc.name      UIExtensionSamples_IsListedPage_0007
     * @tc.desc      isListedPage(item=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0007 begin`);
      const actual: boolean = isListedPage(' a ');
      logInfo(`isListedPage(item=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0008
     * @tc.name      UIExtensionSamples_IsListedPage_0008
     * @tc.desc      isListedPage(item="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0008 begin`);
      const actual: boolean = isListedPage('aa');
      logInfo(`isListedPage(item="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0009
     * @tc.name      UIExtensionSamples_IsListedPage_0009
     * @tc.desc      isListedPage(item="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0009 begin`);
      const actual: boolean = isListedPage('a_1');
      logInfo(`isListedPage(item="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0010
     * @tc.name      UIExtensionSamples_IsListedPage_0010
     * @tc.desc      isListedPage(item="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0010 begin`);
      const actual: boolean = isListedPage('xa');
      logInfo(`isListedPage(item="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0011
     * @tc.name      UIExtensionSamples_IsListedPage_0011
     * @tc.desc      isListedPage(item=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0011 begin`);
      const actual: boolean = isListedPage(' abc ');
      logInfo(`isListedPage(item=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0012
     * @tc.name      UIExtensionSamples_IsListedPage_0012
     * @tc.desc      isListedPage(item="abcabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0012 begin`);
      const actual: boolean = isListedPage('abcabc');
      logInfo(`isListedPage(item="abcabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0013
     * @tc.name      UIExtensionSamples_IsListedPage_0013
     * @tc.desc      isListedPage(item="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0013 begin`);
      const actual: boolean = isListedPage('abc_1');
      logInfo(`isListedPage(item="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0014
     * @tc.name      UIExtensionSamples_IsListedPage_0014
     * @tc.desc      isListedPage(item="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0014 begin`);
      const actual: boolean = isListedPage('xabc');
      logInfo(`isListedPage(item="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0015
     * @tc.name      UIExtensionSamples_IsListedPage_0015
     * @tc.desc      isListedPage(item=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0015 begin`);
      const actual: boolean = isListedPage(' Hello World ');
      logInfo(`isListedPage(item=" Hello World "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0016
     * @tc.name      UIExtensionSamples_IsListedPage_0016
     * @tc.desc      isListedPage(item="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0016 begin`);
      const actual: boolean = isListedPage('Hello WorldHello World');
      logInfo(`isListedPage(item="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0017
     * @tc.name      UIExtensionSamples_IsListedPage_0017
     * @tc.desc      isListedPage(item="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0017 begin`);
      const actual: boolean = isListedPage('Hello World_1');
      logInfo(`isListedPage(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0018
     * @tc.name      UIExtensionSamples_IsListedPage_0018
     * @tc.desc      isListedPage(item="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0018 begin`);
      const actual: boolean = isListedPage('xHello World');
      logInfo(`isListedPage(item="xHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0019
     * @tc.name      UIExtensionSamples_IsListedPage_0019
     * @tc.desc      isListedPage(item="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0019 begin`);
      const actual: boolean = isListedPage('   ');
      logInfo(`isListedPage(item="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0020
     * @tc.name      UIExtensionSamples_IsListedPage_0020
     * @tc.desc      isListedPage(item="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0020 begin`);
      const actual: boolean = isListedPage('  ');
      logInfo(`isListedPage(item="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0021
     * @tc.name      UIExtensionSamples_IsListedPage_0021
     * @tc.desc      isListedPage(item=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0021 begin`);
      const actual: boolean = isListedPage(' _1');
      logInfo(`isListedPage(item=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0022
     * @tc.name      UIExtensionSamples_IsListedPage_0022
     * @tc.desc      isListedPage(item="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0022 begin`);
      const actual: boolean = isListedPage('x ');
      logInfo(`isListedPage(item="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0023
     * @tc.name      UIExtensionSamples_IsListedPage_0023
     * @tc.desc      isListedPage(item=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0023 begin`);
      const actual: boolean = isListedPage(' 123 ');
      logInfo(`isListedPage(item=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0024
     * @tc.name      UIExtensionSamples_IsListedPage_0024
     * @tc.desc      isListedPage(item="123123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0024 begin`);
      const actual: boolean = isListedPage('123123');
      logInfo(`isListedPage(item="123123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0025
     * @tc.name      UIExtensionSamples_IsListedPage_0025
     * @tc.desc      isListedPage(item="123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0025 begin`);
      const actual: boolean = isListedPage('123_1');
      logInfo(`isListedPage(item="123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0026
     * @tc.name      UIExtensionSamples_IsListedPage_0026
     * @tc.desc      isListedPage(item="x123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_IsListedPage_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListedPage_0026 begin`);
      const actual: boolean = isListedPage('x123');
      logInfo(`isListedPage(item="x123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0027
     * @tc.name      UIExtensionSamples_IsListedPage_0027
     * @tc.desc      isListedPage(item="Si") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0027 begin`);
      const actual: boolean = isListedPage('Si');
      logInfo(`isListedPage(item="Si"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0028
     * @tc.name      UIExtensionSamples_IsListedPage_0028
     * @tc.desc      isListedPage(item="XKNu0o") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0028 begin`);
      const actual: boolean = isListedPage('XKNu0o');
      logInfo(`isListedPage(item="XKNu0o"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0029
     * @tc.name      UIExtensionSamples_IsListedPage_0029
     * @tc.desc      isListedPage(item="MSpZ3") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0029 begin`);
      const actual: boolean = isListedPage('MSpZ3');
      logInfo(`isListedPage(item="MSpZ3"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_IS_LISTED_PAGE_0030
     * @tc.name      UIExtensionSamples_IsListedPage_0030
     * @tc.desc      isListedPage(item="z") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_IsListedPage_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListedPage_0030 begin`);
      const actual: boolean = isListedPage('z');
      logInfo(`isListedPage(item="z"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListedPage_0030 end`);
    });
  });
}
