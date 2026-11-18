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
import { titleResourceOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for titleResourceOf (90 cases). */
export default function titleResourceOfTest(): void {
  describe('TitleResourceOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0001
     * @tc.name      UIExtensionSamples_TitleResourceOf_0001
     * @tc.desc      titleResourceOf(item="") returns "app.string."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_TitleResourceOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0001 begin`);
      const actual: string = titleResourceOf('');
      logInfo(`titleResourceOf(item=""): actual=${actual}`);
      expect(actual).assertEqual('app.string.');
      logInfo(`${BUNDLE}TitleResourceOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0002
     * @tc.name      UIExtensionSamples_TitleResourceOf_0002
     * @tc.desc      titleResourceOf(item="a") returns "app.string.a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_TitleResourceOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0002 begin`);
      const actual: string = titleResourceOf('a');
      logInfo(`titleResourceOf(item="a"): actual=${actual}`);
      expect(actual).assertEqual('app.string.a');
      logInfo(`${BUNDLE}TitleResourceOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0003
     * @tc.name      UIExtensionSamples_TitleResourceOf_0003
     * @tc.desc      titleResourceOf(item="abc") returns "app.string.abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0003 begin`);
      const actual: string = titleResourceOf('abc');
      logInfo(`titleResourceOf(item="abc"): actual=${actual}`);
      expect(actual).assertEqual('app.string.abc');
      logInfo(`${BUNDLE}TitleResourceOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0004
     * @tc.name      UIExtensionSamples_TitleResourceOf_0004
     * @tc.desc      titleResourceOf(item="Hello World") returns "app.string.Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0004 begin`);
      const actual: string = titleResourceOf('Hello World');
      logInfo(`titleResourceOf(item="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('app.string.Hello World');
      logInfo(`${BUNDLE}TitleResourceOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0005
     * @tc.name      UIExtensionSamples_TitleResourceOf_0005
     * @tc.desc      titleResourceOf(item=" ") returns "app.string. "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0005 begin`);
      const actual: string = titleResourceOf(' ');
      logInfo(`titleResourceOf(item=" "): actual=${actual}`);
      expect(actual).assertEqual('app.string. ');
      logInfo(`${BUNDLE}TitleResourceOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0006
     * @tc.name      UIExtensionSamples_TitleResourceOf_0006
     * @tc.desc      titleResourceOf(item="123") returns "app.string.123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0006 begin`);
      const actual: string = titleResourceOf('123');
      logInfo(`titleResourceOf(item="123"): actual=${actual}`);
      expect(actual).assertEqual('app.string.123');
      logInfo(`${BUNDLE}TitleResourceOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0007
     * @tc.name      UIExtensionSamples_TitleResourceOf_0007
     * @tc.desc      titleResourceOf(item=" a ") returns "app.string. a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0007 begin`);
      const actual: string = titleResourceOf(' a ');
      logInfo(`titleResourceOf(item=" a "): actual=${actual}`);
      expect(actual).assertEqual('app.string. a ');
      logInfo(`${BUNDLE}TitleResourceOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0008
     * @tc.name      UIExtensionSamples_TitleResourceOf_0008
     * @tc.desc      titleResourceOf(item="aa") returns "app.string.aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0008 begin`);
      const actual: string = titleResourceOf('aa');
      logInfo(`titleResourceOf(item="aa"): actual=${actual}`);
      expect(actual).assertEqual('app.string.aa');
      logInfo(`${BUNDLE}TitleResourceOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0009
     * @tc.name      UIExtensionSamples_TitleResourceOf_0009
     * @tc.desc      titleResourceOf(item="a_1") returns "app.string.a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0009 begin`);
      const actual: string = titleResourceOf('a_1');
      logInfo(`titleResourceOf(item="a_1"): actual=${actual}`);
      expect(actual).assertEqual('app.string.a_1');
      logInfo(`${BUNDLE}TitleResourceOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0010
     * @tc.name      UIExtensionSamples_TitleResourceOf_0010
     * @tc.desc      titleResourceOf(item="xa") returns "app.string.xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0010 begin`);
      const actual: string = titleResourceOf('xa');
      logInfo(`titleResourceOf(item="xa"): actual=${actual}`);
      expect(actual).assertEqual('app.string.xa');
      logInfo(`${BUNDLE}TitleResourceOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0011
     * @tc.name      UIExtensionSamples_TitleResourceOf_0011
     * @tc.desc      titleResourceOf(item=" abc ") returns "app.string. abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0011 begin`);
      const actual: string = titleResourceOf(' abc ');
      logInfo(`titleResourceOf(item=" abc "): actual=${actual}`);
      expect(actual).assertEqual('app.string. abc ');
      logInfo(`${BUNDLE}TitleResourceOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0012
     * @tc.name      UIExtensionSamples_TitleResourceOf_0012
     * @tc.desc      titleResourceOf(item="abcabc") returns "app.string.abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0012 begin`);
      const actual: string = titleResourceOf('abcabc');
      logInfo(`titleResourceOf(item="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('app.string.abcabc');
      logInfo(`${BUNDLE}TitleResourceOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0013
     * @tc.name      UIExtensionSamples_TitleResourceOf_0013
     * @tc.desc      titleResourceOf(item="abc_1") returns "app.string.abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0013 begin`);
      const actual: string = titleResourceOf('abc_1');
      logInfo(`titleResourceOf(item="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('app.string.abc_1');
      logInfo(`${BUNDLE}TitleResourceOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0014
     * @tc.name      UIExtensionSamples_TitleResourceOf_0014
     * @tc.desc      titleResourceOf(item="xabc") returns "app.string.xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0014 begin`);
      const actual: string = titleResourceOf('xabc');
      logInfo(`titleResourceOf(item="xabc"): actual=${actual}`);
      expect(actual).assertEqual('app.string.xabc');
      logInfo(`${BUNDLE}TitleResourceOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0015
     * @tc.name      UIExtensionSamples_TitleResourceOf_0015
     * @tc.desc      titleResourceOf(item=" Hello World ") returns "app.string. Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0015 begin`);
      const actual: string = titleResourceOf(' Hello World ');
      logInfo(`titleResourceOf(item=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('app.string. Hello World ');
      logInfo(`${BUNDLE}TitleResourceOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0016
     * @tc.name      UIExtensionSamples_TitleResourceOf_0016
     * @tc.desc      titleResourceOf(item="Hello WorldHello World") returns "app.string.Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0016 begin`);
      const actual: string = titleResourceOf('Hello WorldHello World');
      logInfo(`titleResourceOf(item="Hello WorldHello Wo...: actual=${actual}`);
      expect(actual).assertEqual('app.string.Hello WorldHello World');
      logInfo(`${BUNDLE}TitleResourceOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0017
     * @tc.name      UIExtensionSamples_TitleResourceOf_0017
     * @tc.desc      titleResourceOf(item="Hello World_1") returns "app.string.Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0017 begin`);
      const actual: string = titleResourceOf('Hello World_1');
      logInfo(`titleResourceOf(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('app.string.Hello World_1');
      logInfo(`${BUNDLE}TitleResourceOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0018
     * @tc.name      UIExtensionSamples_TitleResourceOf_0018
     * @tc.desc      titleResourceOf(item="xHello World") returns "app.string.xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0018 begin`);
      const actual: string = titleResourceOf('xHello World');
      logInfo(`titleResourceOf(item="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('app.string.xHello World');
      logInfo(`${BUNDLE}TitleResourceOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0019
     * @tc.name      UIExtensionSamples_TitleResourceOf_0019
     * @tc.desc      titleResourceOf(item="   ") returns "app.string.   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0019 begin`);
      const actual: string = titleResourceOf('   ');
      logInfo(`titleResourceOf(item="   "): actual=${actual}`);
      expect(actual).assertEqual('app.string.   ');
      logInfo(`${BUNDLE}TitleResourceOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0020
     * @tc.name      UIExtensionSamples_TitleResourceOf_0020
     * @tc.desc      titleResourceOf(item="  ") returns "app.string.  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0020 begin`);
      const actual: string = titleResourceOf('  ');
      logInfo(`titleResourceOf(item="  "): actual=${actual}`);
      expect(actual).assertEqual('app.string.  ');
      logInfo(`${BUNDLE}TitleResourceOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0021
     * @tc.name      UIExtensionSamples_TitleResourceOf_0021
     * @tc.desc      titleResourceOf(item=" _1") returns "app.string. _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0021 begin`);
      const actual: string = titleResourceOf(' _1');
      logInfo(`titleResourceOf(item=" _1"): actual=${actual}`);
      expect(actual).assertEqual('app.string. _1');
      logInfo(`${BUNDLE}TitleResourceOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0022
     * @tc.name      UIExtensionSamples_TitleResourceOf_0022
     * @tc.desc      titleResourceOf(item="x ") returns "app.string.x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0022 begin`);
      const actual: string = titleResourceOf('x ');
      logInfo(`titleResourceOf(item="x "): actual=${actual}`);
      expect(actual).assertEqual('app.string.x ');
      logInfo(`${BUNDLE}TitleResourceOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0023
     * @tc.name      UIExtensionSamples_TitleResourceOf_0023
     * @tc.desc      titleResourceOf(item=" 123 ") returns "app.string. 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0023 begin`);
      const actual: string = titleResourceOf(' 123 ');
      logInfo(`titleResourceOf(item=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('app.string. 123 ');
      logInfo(`${BUNDLE}TitleResourceOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0024
     * @tc.name      UIExtensionSamples_TitleResourceOf_0024
     * @tc.desc      titleResourceOf(item="123123") returns "app.string.123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0024 begin`);
      const actual: string = titleResourceOf('123123');
      logInfo(`titleResourceOf(item="123123"): actual=${actual}`);
      expect(actual).assertEqual('app.string.123123');
      logInfo(`${BUNDLE}TitleResourceOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0025
     * @tc.name      UIExtensionSamples_TitleResourceOf_0025
     * @tc.desc      titleResourceOf(item="123_1") returns "app.string.123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0025 begin`);
      const actual: string = titleResourceOf('123_1');
      logInfo(`titleResourceOf(item="123_1"): actual=${actual}`);
      expect(actual).assertEqual('app.string.123_1');
      logInfo(`${BUNDLE}TitleResourceOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0026
     * @tc.name      UIExtensionSamples_TitleResourceOf_0026
     * @tc.desc      titleResourceOf(item="x123") returns "app.string.x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_TitleResourceOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0026 begin`);
      const actual: string = titleResourceOf('x123');
      logInfo(`titleResourceOf(item="x123"): actual=${actual}`);
      expect(actual).assertEqual('app.string.x123');
      logInfo(`${BUNDLE}TitleResourceOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0027
     * @tc.name      UIExtensionSamples_TitleResourceOf_0027
     * @tc.desc      titleResourceOf(item="rDh3QbNoD3J") returns "app.string.rDh3QbNoD3J"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0027 begin`);
      const actual: string = titleResourceOf('rDh3QbNoD3J');
      logInfo(`titleResourceOf(item="rDh3QbNoD3J"): actual=${actual}`);
      expect(actual).assertEqual('app.string.rDh3QbNoD3J');
      logInfo(`${BUNDLE}TitleResourceOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0028
     * @tc.name      UIExtensionSamples_TitleResourceOf_0028
     * @tc.desc      titleResourceOf(item="nrD") returns "app.string.nrD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0028 begin`);
      const actual: string = titleResourceOf('nrD');
      logInfo(`titleResourceOf(item="nrD"): actual=${actual}`);
      expect(actual).assertEqual('app.string.nrD');
      logInfo(`${BUNDLE}TitleResourceOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0029
     * @tc.name      UIExtensionSamples_TitleResourceOf_0029
     * @tc.desc      titleResourceOf(item="Ajzasm") returns "app.string.Ajzasm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0029 begin`);
      const actual: string = titleResourceOf('Ajzasm');
      logInfo(`titleResourceOf(item="Ajzasm"): actual=${actual}`);
      expect(actual).assertEqual('app.string.Ajzasm');
      logInfo(`${BUNDLE}TitleResourceOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0030
     * @tc.name      UIExtensionSamples_TitleResourceOf_0030
     * @tc.desc      titleResourceOf(item="QuLk8i6") returns "app.string.QuLk8i6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0030 begin`);
      const actual: string = titleResourceOf('QuLk8i6');
      logInfo(`titleResourceOf(item="QuLk8i6"): actual=${actual}`);
      expect(actual).assertEqual('app.string.QuLk8i6');
      logInfo(`${BUNDLE}TitleResourceOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0031
     * @tc.name      UIExtensionSamples_TitleResourceOf_0031
     * @tc.desc      titleResourceOf(item="hskSj") returns "app.string.hskSj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0031 begin`);
      const actual: string = titleResourceOf('hskSj');
      logInfo(`titleResourceOf(item="hskSj"): actual=${actual}`);
      expect(actual).assertEqual('app.string.hskSj');
      logInfo(`${BUNDLE}TitleResourceOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0032
     * @tc.name      UIExtensionSamples_TitleResourceOf_0032
     * @tc.desc      titleResourceOf(item="4jAhus9f3w") returns "app.string.4jAhus9f3w"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0032 begin`);
      const actual: string = titleResourceOf('4jAhus9f3w');
      logInfo(`titleResourceOf(item="4jAhus9f3w"): actual=${actual}`);
      expect(actual).assertEqual('app.string.4jAhus9f3w');
      logInfo(`${BUNDLE}TitleResourceOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0033
     * @tc.name      UIExtensionSamples_TitleResourceOf_0033
     * @tc.desc      titleResourceOf(item="vaaD73gdcV") returns "app.string.vaaD73gdcV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0033 begin`);
      const actual: string = titleResourceOf('vaaD73gdcV');
      logInfo(`titleResourceOf(item="vaaD73gdcV"): actual=${actual}`);
      expect(actual).assertEqual('app.string.vaaD73gdcV');
      logInfo(`${BUNDLE}TitleResourceOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0034
     * @tc.name      UIExtensionSamples_TitleResourceOf_0034
     * @tc.desc      titleResourceOf(item="KtBmXlXda") returns "app.string.KtBmXlXda"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0034 begin`);
      const actual: string = titleResourceOf('KtBmXlXda');
      logInfo(`titleResourceOf(item="KtBmXlXda"): actual=${actual}`);
      expect(actual).assertEqual('app.string.KtBmXlXda');
      logInfo(`${BUNDLE}TitleResourceOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0035
     * @tc.name      UIExtensionSamples_TitleResourceOf_0035
     * @tc.desc      titleResourceOf(item="C0IBGfkB") returns "app.string.C0IBGfkB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0035 begin`);
      const actual: string = titleResourceOf('C0IBGfkB');
      logInfo(`titleResourceOf(item="C0IBGfkB"): actual=${actual}`);
      expect(actual).assertEqual('app.string.C0IBGfkB');
      logInfo(`${BUNDLE}TitleResourceOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0036
     * @tc.name      UIExtensionSamples_TitleResourceOf_0036
     * @tc.desc      titleResourceOf(item="tc0hmRvM") returns "app.string.tc0hmRvM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0036 begin`);
      const actual: string = titleResourceOf('tc0hmRvM');
      logInfo(`titleResourceOf(item="tc0hmRvM"): actual=${actual}`);
      expect(actual).assertEqual('app.string.tc0hmRvM');
      logInfo(`${BUNDLE}TitleResourceOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0037
     * @tc.name      UIExtensionSamples_TitleResourceOf_0037
     * @tc.desc      titleResourceOf(item="kGOmS0BI1g") returns "app.string.kGOmS0BI1g"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0037 begin`);
      const actual: string = titleResourceOf('kGOmS0BI1g');
      logInfo(`titleResourceOf(item="kGOmS0BI1g"): actual=${actual}`);
      expect(actual).assertEqual('app.string.kGOmS0BI1g');
      logInfo(`${BUNDLE}TitleResourceOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0038
     * @tc.name      UIExtensionSamples_TitleResourceOf_0038
     * @tc.desc      titleResourceOf(item="EOL2tLT") returns "app.string.EOL2tLT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0038 begin`);
      const actual: string = titleResourceOf('EOL2tLT');
      logInfo(`titleResourceOf(item="EOL2tLT"): actual=${actual}`);
      expect(actual).assertEqual('app.string.EOL2tLT');
      logInfo(`${BUNDLE}TitleResourceOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0039
     * @tc.name      UIExtensionSamples_TitleResourceOf_0039
     * @tc.desc      titleResourceOf(item="zm8") returns "app.string.zm8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0039 begin`);
      const actual: string = titleResourceOf('zm8');
      logInfo(`titleResourceOf(item="zm8"): actual=${actual}`);
      expect(actual).assertEqual('app.string.zm8');
      logInfo(`${BUNDLE}TitleResourceOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0040
     * @tc.name      UIExtensionSamples_TitleResourceOf_0040
     * @tc.desc      titleResourceOf(item="9wfSmaoV") returns "app.string.9wfSmaoV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0040 begin`);
      const actual: string = titleResourceOf('9wfSmaoV');
      logInfo(`titleResourceOf(item="9wfSmaoV"): actual=${actual}`);
      expect(actual).assertEqual('app.string.9wfSmaoV');
      logInfo(`${BUNDLE}TitleResourceOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0041
     * @tc.name      UIExtensionSamples_TitleResourceOf_0041
     * @tc.desc      titleResourceOf(item="WyGgzy8RFbi") returns "app.string.WyGgzy8RFbi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0041 begin`);
      const actual: string = titleResourceOf('WyGgzy8RFbi');
      logInfo(`titleResourceOf(item="WyGgzy8RFbi"): actual=${actual}`);
      expect(actual).assertEqual('app.string.WyGgzy8RFbi');
      logInfo(`${BUNDLE}TitleResourceOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0042
     * @tc.name      UIExtensionSamples_TitleResourceOf_0042
     * @tc.desc      titleResourceOf(item="e0oMG1L") returns "app.string.e0oMG1L"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0042 begin`);
      const actual: string = titleResourceOf('e0oMG1L');
      logInfo(`titleResourceOf(item="e0oMG1L"): actual=${actual}`);
      expect(actual).assertEqual('app.string.e0oMG1L');
      logInfo(`${BUNDLE}TitleResourceOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0043
     * @tc.name      UIExtensionSamples_TitleResourceOf_0043
     * @tc.desc      titleResourceOf(item="b") returns "app.string.b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0043 begin`);
      const actual: string = titleResourceOf('b');
      logInfo(`titleResourceOf(item="b"): actual=${actual}`);
      expect(actual).assertEqual('app.string.b');
      logInfo(`${BUNDLE}TitleResourceOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0044
     * @tc.name      UIExtensionSamples_TitleResourceOf_0044
     * @tc.desc      titleResourceOf(item="3S") returns "app.string.3S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0044 begin`);
      const actual: string = titleResourceOf('3S');
      logInfo(`titleResourceOf(item="3S"): actual=${actual}`);
      expect(actual).assertEqual('app.string.3S');
      logInfo(`${BUNDLE}TitleResourceOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0045
     * @tc.name      UIExtensionSamples_TitleResourceOf_0045
     * @tc.desc      titleResourceOf(item="LBuE3Ql") returns "app.string.LBuE3Ql"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0045 begin`);
      const actual: string = titleResourceOf('LBuE3Ql');
      logInfo(`titleResourceOf(item="LBuE3Ql"): actual=${actual}`);
      expect(actual).assertEqual('app.string.LBuE3Ql');
      logInfo(`${BUNDLE}TitleResourceOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0046
     * @tc.name      UIExtensionSamples_TitleResourceOf_0046
     * @tc.desc      titleResourceOf(item="X7") returns "app.string.X7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0046 begin`);
      const actual: string = titleResourceOf('X7');
      logInfo(`titleResourceOf(item="X7"): actual=${actual}`);
      expect(actual).assertEqual('app.string.X7');
      logInfo(`${BUNDLE}TitleResourceOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0047
     * @tc.name      UIExtensionSamples_TitleResourceOf_0047
     * @tc.desc      titleResourceOf(item="mBgUjlnObL") returns "app.string.mBgUjlnObL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0047 begin`);
      const actual: string = titleResourceOf('mBgUjlnObL');
      logInfo(`titleResourceOf(item="mBgUjlnObL"): actual=${actual}`);
      expect(actual).assertEqual('app.string.mBgUjlnObL');
      logInfo(`${BUNDLE}TitleResourceOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0048
     * @tc.name      UIExtensionSamples_TitleResourceOf_0048
     * @tc.desc      titleResourceOf(item="WT") returns "app.string.WT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0048 begin`);
      const actual: string = titleResourceOf('WT');
      logInfo(`titleResourceOf(item="WT"): actual=${actual}`);
      expect(actual).assertEqual('app.string.WT');
      logInfo(`${BUNDLE}TitleResourceOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0049
     * @tc.name      UIExtensionSamples_TitleResourceOf_0049
     * @tc.desc      titleResourceOf(item="uZkRva") returns "app.string.uZkRva"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0049 begin`);
      const actual: string = titleResourceOf('uZkRva');
      logInfo(`titleResourceOf(item="uZkRva"): actual=${actual}`);
      expect(actual).assertEqual('app.string.uZkRva');
      logInfo(`${BUNDLE}TitleResourceOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0050
     * @tc.name      UIExtensionSamples_TitleResourceOf_0050
     * @tc.desc      titleResourceOf(item="M") returns "app.string.M"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0050 begin`);
      const actual: string = titleResourceOf('M');
      logInfo(`titleResourceOf(item="M"): actual=${actual}`);
      expect(actual).assertEqual('app.string.M');
      logInfo(`${BUNDLE}TitleResourceOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0051
     * @tc.name      UIExtensionSamples_TitleResourceOf_0051
     * @tc.desc      titleResourceOf(item="DpBdpC") returns "app.string.DpBdpC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0051 begin`);
      const actual: string = titleResourceOf('DpBdpC');
      logInfo(`titleResourceOf(item="DpBdpC"): actual=${actual}`);
      expect(actual).assertEqual('app.string.DpBdpC');
      logInfo(`${BUNDLE}TitleResourceOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0052
     * @tc.name      UIExtensionSamples_TitleResourceOf_0052
     * @tc.desc      titleResourceOf(item="nHRT") returns "app.string.nHRT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0052 begin`);
      const actual: string = titleResourceOf('nHRT');
      logInfo(`titleResourceOf(item="nHRT"): actual=${actual}`);
      expect(actual).assertEqual('app.string.nHRT');
      logInfo(`${BUNDLE}TitleResourceOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0053
     * @tc.name      UIExtensionSamples_TitleResourceOf_0053
     * @tc.desc      titleResourceOf(item="EdySPRl8") returns "app.string.EdySPRl8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0053 begin`);
      const actual: string = titleResourceOf('EdySPRl8');
      logInfo(`titleResourceOf(item="EdySPRl8"): actual=${actual}`);
      expect(actual).assertEqual('app.string.EdySPRl8');
      logInfo(`${BUNDLE}TitleResourceOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0054
     * @tc.name      UIExtensionSamples_TitleResourceOf_0054
     * @tc.desc      titleResourceOf(item="kbnEwHN09qAe") returns "app.string.kbnEwHN09qAe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0054 begin`);
      const actual: string = titleResourceOf('kbnEwHN09qAe');
      logInfo(`titleResourceOf(item="kbnEwHN09qAe"): actual=${actual}`);
      expect(actual).assertEqual('app.string.kbnEwHN09qAe');
      logInfo(`${BUNDLE}TitleResourceOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0055
     * @tc.name      UIExtensionSamples_TitleResourceOf_0055
     * @tc.desc      titleResourceOf(item="NSz48DPUfhO") returns "app.string.NSz48DPUfhO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0055 begin`);
      const actual: string = titleResourceOf('NSz48DPUfhO');
      logInfo(`titleResourceOf(item="NSz48DPUfhO"): actual=${actual}`);
      expect(actual).assertEqual('app.string.NSz48DPUfhO');
      logInfo(`${BUNDLE}TitleResourceOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0056
     * @tc.name      UIExtensionSamples_TitleResourceOf_0056
     * @tc.desc      titleResourceOf(item="6eogf4xxjK") returns "app.string.6eogf4xxjK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0056 begin`);
      const actual: string = titleResourceOf('6eogf4xxjK');
      logInfo(`titleResourceOf(item="6eogf4xxjK"): actual=${actual}`);
      expect(actual).assertEqual('app.string.6eogf4xxjK');
      logInfo(`${BUNDLE}TitleResourceOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0057
     * @tc.name      UIExtensionSamples_TitleResourceOf_0057
     * @tc.desc      titleResourceOf(item="Whd") returns "app.string.Whd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0057 begin`);
      const actual: string = titleResourceOf('Whd');
      logInfo(`titleResourceOf(item="Whd"): actual=${actual}`);
      expect(actual).assertEqual('app.string.Whd');
      logInfo(`${BUNDLE}TitleResourceOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0058
     * @tc.name      UIExtensionSamples_TitleResourceOf_0058
     * @tc.desc      titleResourceOf(item="LDFQ") returns "app.string.LDFQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0058 begin`);
      const actual: string = titleResourceOf('LDFQ');
      logInfo(`titleResourceOf(item="LDFQ"): actual=${actual}`);
      expect(actual).assertEqual('app.string.LDFQ');
      logInfo(`${BUNDLE}TitleResourceOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0059
     * @tc.name      UIExtensionSamples_TitleResourceOf_0059
     * @tc.desc      titleResourceOf(item="ub8cA") returns "app.string.ub8cA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0059 begin`);
      const actual: string = titleResourceOf('ub8cA');
      logInfo(`titleResourceOf(item="ub8cA"): actual=${actual}`);
      expect(actual).assertEqual('app.string.ub8cA');
      logInfo(`${BUNDLE}TitleResourceOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0060
     * @tc.name      UIExtensionSamples_TitleResourceOf_0060
     * @tc.desc      titleResourceOf(item="BnZbpz") returns "app.string.BnZbpz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0060 begin`);
      const actual: string = titleResourceOf('BnZbpz');
      logInfo(`titleResourceOf(item="BnZbpz"): actual=${actual}`);
      expect(actual).assertEqual('app.string.BnZbpz');
      logInfo(`${BUNDLE}TitleResourceOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0061
     * @tc.name      UIExtensionSamples_TitleResourceOf_0061
     * @tc.desc      titleResourceOf(item="KvxV2") returns "app.string.KvxV2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0061 begin`);
      const actual: string = titleResourceOf('KvxV2');
      logInfo(`titleResourceOf(item="KvxV2"): actual=${actual}`);
      expect(actual).assertEqual('app.string.KvxV2');
      logInfo(`${BUNDLE}TitleResourceOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0062
     * @tc.name      UIExtensionSamples_TitleResourceOf_0062
     * @tc.desc      titleResourceOf(item="I9U") returns "app.string.I9U"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0062 begin`);
      const actual: string = titleResourceOf('I9U');
      logInfo(`titleResourceOf(item="I9U"): actual=${actual}`);
      expect(actual).assertEqual('app.string.I9U');
      logInfo(`${BUNDLE}TitleResourceOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0063
     * @tc.name      UIExtensionSamples_TitleResourceOf_0063
     * @tc.desc      titleResourceOf(item="iORz") returns "app.string.iORz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0063 begin`);
      const actual: string = titleResourceOf('iORz');
      logInfo(`titleResourceOf(item="iORz"): actual=${actual}`);
      expect(actual).assertEqual('app.string.iORz');
      logInfo(`${BUNDLE}TitleResourceOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0064
     * @tc.name      UIExtensionSamples_TitleResourceOf_0064
     * @tc.desc      titleResourceOf(item="rrI9") returns "app.string.rrI9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0064 begin`);
      const actual: string = titleResourceOf('rrI9');
      logInfo(`titleResourceOf(item="rrI9"): actual=${actual}`);
      expect(actual).assertEqual('app.string.rrI9');
      logInfo(`${BUNDLE}TitleResourceOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0065
     * @tc.name      UIExtensionSamples_TitleResourceOf_0065
     * @tc.desc      titleResourceOf(item="ym95sQhZ0c") returns "app.string.ym95sQhZ0c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0065 begin`);
      const actual: string = titleResourceOf('ym95sQhZ0c');
      logInfo(`titleResourceOf(item="ym95sQhZ0c"): actual=${actual}`);
      expect(actual).assertEqual('app.string.ym95sQhZ0c');
      logInfo(`${BUNDLE}TitleResourceOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0066
     * @tc.name      UIExtensionSamples_TitleResourceOf_0066
     * @tc.desc      titleResourceOf(item="PwVZOo7Gu") returns "app.string.PwVZOo7Gu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0066 begin`);
      const actual: string = titleResourceOf('PwVZOo7Gu');
      logInfo(`titleResourceOf(item="PwVZOo7Gu"): actual=${actual}`);
      expect(actual).assertEqual('app.string.PwVZOo7Gu');
      logInfo(`${BUNDLE}TitleResourceOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0067
     * @tc.name      UIExtensionSamples_TitleResourceOf_0067
     * @tc.desc      titleResourceOf(item="sr9GBVwFQV") returns "app.string.sr9GBVwFQV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0067 begin`);
      const actual: string = titleResourceOf('sr9GBVwFQV');
      logInfo(`titleResourceOf(item="sr9GBVwFQV"): actual=${actual}`);
      expect(actual).assertEqual('app.string.sr9GBVwFQV');
      logInfo(`${BUNDLE}TitleResourceOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0068
     * @tc.name      UIExtensionSamples_TitleResourceOf_0068
     * @tc.desc      titleResourceOf(item="b4J") returns "app.string.b4J"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0068 begin`);
      const actual: string = titleResourceOf('b4J');
      logInfo(`titleResourceOf(item="b4J"): actual=${actual}`);
      expect(actual).assertEqual('app.string.b4J');
      logInfo(`${BUNDLE}TitleResourceOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0069
     * @tc.name      UIExtensionSamples_TitleResourceOf_0069
     * @tc.desc      titleResourceOf(item="SqzcOZC") returns "app.string.SqzcOZC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0069 begin`);
      const actual: string = titleResourceOf('SqzcOZC');
      logInfo(`titleResourceOf(item="SqzcOZC"): actual=${actual}`);
      expect(actual).assertEqual('app.string.SqzcOZC');
      logInfo(`${BUNDLE}TitleResourceOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0070
     * @tc.name      UIExtensionSamples_TitleResourceOf_0070
     * @tc.desc      titleResourceOf(item="JXTG7HvbV1Oh") returns "app.string.JXTG7HvbV1Oh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0070 begin`);
      const actual: string = titleResourceOf('JXTG7HvbV1Oh');
      logInfo(`titleResourceOf(item="JXTG7HvbV1Oh"): actual=${actual}`);
      expect(actual).assertEqual('app.string.JXTG7HvbV1Oh');
      logInfo(`${BUNDLE}TitleResourceOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0071
     * @tc.name      UIExtensionSamples_TitleResourceOf_0071
     * @tc.desc      titleResourceOf(item="A") returns "app.string.A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0071 begin`);
      const actual: string = titleResourceOf('A');
      logInfo(`titleResourceOf(item="A"): actual=${actual}`);
      expect(actual).assertEqual('app.string.A');
      logInfo(`${BUNDLE}TitleResourceOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0072
     * @tc.name      UIExtensionSamples_TitleResourceOf_0072
     * @tc.desc      titleResourceOf(item="jwtC5Yr") returns "app.string.jwtC5Yr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0072 begin`);
      const actual: string = titleResourceOf('jwtC5Yr');
      logInfo(`titleResourceOf(item="jwtC5Yr"): actual=${actual}`);
      expect(actual).assertEqual('app.string.jwtC5Yr');
      logInfo(`${BUNDLE}TitleResourceOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0073
     * @tc.name      UIExtensionSamples_TitleResourceOf_0073
     * @tc.desc      titleResourceOf(item="Ztt") returns "app.string.Ztt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0073 begin`);
      const actual: string = titleResourceOf('Ztt');
      logInfo(`titleResourceOf(item="Ztt"): actual=${actual}`);
      expect(actual).assertEqual('app.string.Ztt');
      logInfo(`${BUNDLE}TitleResourceOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0074
     * @tc.name      UIExtensionSamples_TitleResourceOf_0074
     * @tc.desc      titleResourceOf(item="y2XuS7Pw") returns "app.string.y2XuS7Pw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0074 begin`);
      const actual: string = titleResourceOf('y2XuS7Pw');
      logInfo(`titleResourceOf(item="y2XuS7Pw"): actual=${actual}`);
      expect(actual).assertEqual('app.string.y2XuS7Pw');
      logInfo(`${BUNDLE}TitleResourceOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0075
     * @tc.name      UIExtensionSamples_TitleResourceOf_0075
     * @tc.desc      titleResourceOf(item="x") returns "app.string.x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0075 begin`);
      const actual: string = titleResourceOf('x');
      logInfo(`titleResourceOf(item="x"): actual=${actual}`);
      expect(actual).assertEqual('app.string.x');
      logInfo(`${BUNDLE}TitleResourceOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0076
     * @tc.name      UIExtensionSamples_TitleResourceOf_0076
     * @tc.desc      titleResourceOf(item="7DFZqhuc8Ol") returns "app.string.7DFZqhuc8Ol"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0076 begin`);
      const actual: string = titleResourceOf('7DFZqhuc8Ol');
      logInfo(`titleResourceOf(item="7DFZqhuc8Ol"): actual=${actual}`);
      expect(actual).assertEqual('app.string.7DFZqhuc8Ol');
      logInfo(`${BUNDLE}TitleResourceOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0077
     * @tc.name      UIExtensionSamples_TitleResourceOf_0077
     * @tc.desc      titleResourceOf(item="vM") returns "app.string.vM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0077 begin`);
      const actual: string = titleResourceOf('vM');
      logInfo(`titleResourceOf(item="vM"): actual=${actual}`);
      expect(actual).assertEqual('app.string.vM');
      logInfo(`${BUNDLE}TitleResourceOf_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0078
     * @tc.name      UIExtensionSamples_TitleResourceOf_0078
     * @tc.desc      titleResourceOf(item="5VjYgt") returns "app.string.5VjYgt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0078 begin`);
      const actual: string = titleResourceOf('5VjYgt');
      logInfo(`titleResourceOf(item="5VjYgt"): actual=${actual}`);
      expect(actual).assertEqual('app.string.5VjYgt');
      logInfo(`${BUNDLE}TitleResourceOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0079
     * @tc.name      UIExtensionSamples_TitleResourceOf_0079
     * @tc.desc      titleResourceOf(item="vCGwEAqQo") returns "app.string.vCGwEAqQo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0079 begin`);
      const actual: string = titleResourceOf('vCGwEAqQo');
      logInfo(`titleResourceOf(item="vCGwEAqQo"): actual=${actual}`);
      expect(actual).assertEqual('app.string.vCGwEAqQo');
      logInfo(`${BUNDLE}TitleResourceOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0080
     * @tc.name      UIExtensionSamples_TitleResourceOf_0080
     * @tc.desc      titleResourceOf(item="bRQmO6BxQt") returns "app.string.bRQmO6BxQt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0080 begin`);
      const actual: string = titleResourceOf('bRQmO6BxQt');
      logInfo(`titleResourceOf(item="bRQmO6BxQt"): actual=${actual}`);
      expect(actual).assertEqual('app.string.bRQmO6BxQt');
      logInfo(`${BUNDLE}TitleResourceOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0081
     * @tc.name      UIExtensionSamples_TitleResourceOf_0081
     * @tc.desc      titleResourceOf(item="PILo319ga") returns "app.string.PILo319ga"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0081 begin`);
      const actual: string = titleResourceOf('PILo319ga');
      logInfo(`titleResourceOf(item="PILo319ga"): actual=${actual}`);
      expect(actual).assertEqual('app.string.PILo319ga');
      logInfo(`${BUNDLE}TitleResourceOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0082
     * @tc.name      UIExtensionSamples_TitleResourceOf_0082
     * @tc.desc      titleResourceOf(item="a0BDnmxPdzP") returns "app.string.a0BDnmxPdzP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0082 begin`);
      const actual: string = titleResourceOf('a0BDnmxPdzP');
      logInfo(`titleResourceOf(item="a0BDnmxPdzP"): actual=${actual}`);
      expect(actual).assertEqual('app.string.a0BDnmxPdzP');
      logInfo(`${BUNDLE}TitleResourceOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0083
     * @tc.name      UIExtensionSamples_TitleResourceOf_0083
     * @tc.desc      titleResourceOf(item="Z9Tfx2Jxt1") returns "app.string.Z9Tfx2Jxt1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0083 begin`);
      const actual: string = titleResourceOf('Z9Tfx2Jxt1');
      logInfo(`titleResourceOf(item="Z9Tfx2Jxt1"): actual=${actual}`);
      expect(actual).assertEqual('app.string.Z9Tfx2Jxt1');
      logInfo(`${BUNDLE}TitleResourceOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0084
     * @tc.name      UIExtensionSamples_TitleResourceOf_0084
     * @tc.desc      titleResourceOf(item="sT2TSrbLzhW") returns "app.string.sT2TSrbLzhW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0084 begin`);
      const actual: string = titleResourceOf('sT2TSrbLzhW');
      logInfo(`titleResourceOf(item="sT2TSrbLzhW"): actual=${actual}`);
      expect(actual).assertEqual('app.string.sT2TSrbLzhW');
      logInfo(`${BUNDLE}TitleResourceOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0085
     * @tc.name      UIExtensionSamples_TitleResourceOf_0085
     * @tc.desc      titleResourceOf(item="vmg8") returns "app.string.vmg8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0085 begin`);
      const actual: string = titleResourceOf('vmg8');
      logInfo(`titleResourceOf(item="vmg8"): actual=${actual}`);
      expect(actual).assertEqual('app.string.vmg8');
      logInfo(`${BUNDLE}TitleResourceOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0086
     * @tc.name      UIExtensionSamples_TitleResourceOf_0086
     * @tc.desc      titleResourceOf(item="av69D4FdN") returns "app.string.av69D4FdN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0086 begin`);
      const actual: string = titleResourceOf('av69D4FdN');
      logInfo(`titleResourceOf(item="av69D4FdN"): actual=${actual}`);
      expect(actual).assertEqual('app.string.av69D4FdN');
      logInfo(`${BUNDLE}TitleResourceOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0087
     * @tc.name      UIExtensionSamples_TitleResourceOf_0087
     * @tc.desc      titleResourceOf(item="PqMU0ig9L") returns "app.string.PqMU0ig9L"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0087 begin`);
      const actual: string = titleResourceOf('PqMU0ig9L');
      logInfo(`titleResourceOf(item="PqMU0ig9L"): actual=${actual}`);
      expect(actual).assertEqual('app.string.PqMU0ig9L');
      logInfo(`${BUNDLE}TitleResourceOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0088
     * @tc.name      UIExtensionSamples_TitleResourceOf_0088
     * @tc.desc      titleResourceOf(item="CDG1XSnE0") returns "app.string.CDG1XSnE0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0088 begin`);
      const actual: string = titleResourceOf('CDG1XSnE0');
      logInfo(`titleResourceOf(item="CDG1XSnE0"): actual=${actual}`);
      expect(actual).assertEqual('app.string.CDG1XSnE0');
      logInfo(`${BUNDLE}TitleResourceOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0089
     * @tc.name      UIExtensionSamples_TitleResourceOf_0089
     * @tc.desc      titleResourceOf(item="6FGcxO") returns "app.string.6FGcxO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0089 begin`);
      const actual: string = titleResourceOf('6FGcxO');
      logInfo(`titleResourceOf(item="6FGcxO"): actual=${actual}`);
      expect(actual).assertEqual('app.string.6FGcxO');
      logInfo(`${BUNDLE}TitleResourceOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TITLE_RESOURCE_OF_0090
     * @tc.name      UIExtensionSamples_TitleResourceOf_0090
     * @tc.desc      titleResourceOf(item="V") returns "app.string.V"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TitleResourceOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleResourceOf_0090 begin`);
      const actual: string = titleResourceOf('V');
      logInfo(`titleResourceOf(item="V"): actual=${actual}`);
      expect(actual).assertEqual('app.string.V');
      logInfo(`${BUNDLE}TitleResourceOf_0090 end`);
    });
  });
}
