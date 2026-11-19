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
import { listKeyOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listKeyOf (90 cases). */
export default function listKeyOfTest(): void {
  describe('ListKeyOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0001
     * @tc.name      UIExtensionSamples_ListKeyOf_0001
     * @tc.desc      listKeyOf(item="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ListKeyOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ListKeyOf_0001 begin`);
      const actual: string = listKeyOf('');
      logInfo(`listKeyOf(item=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ListKeyOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0002
     * @tc.name      UIExtensionSamples_ListKeyOf_0002
     * @tc.desc      listKeyOf(item="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ListKeyOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ListKeyOf_0002 begin`);
      const actual: string = listKeyOf('a');
      logInfo(`listKeyOf(item="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ListKeyOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0003
     * @tc.name      UIExtensionSamples_ListKeyOf_0003
     * @tc.desc      listKeyOf(item="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0003 begin`);
      const actual: string = listKeyOf('abc');
      logInfo(`listKeyOf(item="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ListKeyOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0004
     * @tc.name      UIExtensionSamples_ListKeyOf_0004
     * @tc.desc      listKeyOf(item="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0004 begin`);
      const actual: string = listKeyOf('Hello World');
      logInfo(`listKeyOf(item="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ListKeyOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0005
     * @tc.name      UIExtensionSamples_ListKeyOf_0005
     * @tc.desc      listKeyOf(item=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0005 begin`);
      const actual: string = listKeyOf(' ');
      logInfo(`listKeyOf(item=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ListKeyOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0006
     * @tc.name      UIExtensionSamples_ListKeyOf_0006
     * @tc.desc      listKeyOf(item="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0006 begin`);
      const actual: string = listKeyOf('123');
      logInfo(`listKeyOf(item="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ListKeyOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0007
     * @tc.name      UIExtensionSamples_ListKeyOf_0007
     * @tc.desc      listKeyOf(item=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0007 begin`);
      const actual: string = listKeyOf(' a ');
      logInfo(`listKeyOf(item=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}ListKeyOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0008
     * @tc.name      UIExtensionSamples_ListKeyOf_0008
     * @tc.desc      listKeyOf(item="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0008 begin`);
      const actual: string = listKeyOf('aa');
      logInfo(`listKeyOf(item="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}ListKeyOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0009
     * @tc.name      UIExtensionSamples_ListKeyOf_0009
     * @tc.desc      listKeyOf(item="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0009 begin`);
      const actual: string = listKeyOf('a_1');
      logInfo(`listKeyOf(item="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}ListKeyOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0010
     * @tc.name      UIExtensionSamples_ListKeyOf_0010
     * @tc.desc      listKeyOf(item="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0010 begin`);
      const actual: string = listKeyOf('xa');
      logInfo(`listKeyOf(item="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}ListKeyOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0011
     * @tc.name      UIExtensionSamples_ListKeyOf_0011
     * @tc.desc      listKeyOf(item=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0011 begin`);
      const actual: string = listKeyOf(' abc ');
      logInfo(`listKeyOf(item=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}ListKeyOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0012
     * @tc.name      UIExtensionSamples_ListKeyOf_0012
     * @tc.desc      listKeyOf(item="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0012 begin`);
      const actual: string = listKeyOf('abcabc');
      logInfo(`listKeyOf(item="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}ListKeyOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0013
     * @tc.name      UIExtensionSamples_ListKeyOf_0013
     * @tc.desc      listKeyOf(item="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0013 begin`);
      const actual: string = listKeyOf('abc_1');
      logInfo(`listKeyOf(item="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}ListKeyOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0014
     * @tc.name      UIExtensionSamples_ListKeyOf_0014
     * @tc.desc      listKeyOf(item="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0014 begin`);
      const actual: string = listKeyOf('xabc');
      logInfo(`listKeyOf(item="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}ListKeyOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0015
     * @tc.name      UIExtensionSamples_ListKeyOf_0015
     * @tc.desc      listKeyOf(item=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0015 begin`);
      const actual: string = listKeyOf(' Hello World ');
      logInfo(`listKeyOf(item=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}ListKeyOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0016
     * @tc.name      UIExtensionSamples_ListKeyOf_0016
     * @tc.desc      listKeyOf(item="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0016 begin`);
      const actual: string = listKeyOf('Hello WorldHello World');
      logInfo(`listKeyOf(item="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}ListKeyOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0017
     * @tc.name      UIExtensionSamples_ListKeyOf_0017
     * @tc.desc      listKeyOf(item="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0017 begin`);
      const actual: string = listKeyOf('Hello World_1');
      logInfo(`listKeyOf(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}ListKeyOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0018
     * @tc.name      UIExtensionSamples_ListKeyOf_0018
     * @tc.desc      listKeyOf(item="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0018 begin`);
      const actual: string = listKeyOf('xHello World');
      logInfo(`listKeyOf(item="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}ListKeyOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0019
     * @tc.name      UIExtensionSamples_ListKeyOf_0019
     * @tc.desc      listKeyOf(item="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0019 begin`);
      const actual: string = listKeyOf('   ');
      logInfo(`listKeyOf(item="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ListKeyOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0020
     * @tc.name      UIExtensionSamples_ListKeyOf_0020
     * @tc.desc      listKeyOf(item="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0020 begin`);
      const actual: string = listKeyOf('  ');
      logInfo(`listKeyOf(item="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}ListKeyOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0021
     * @tc.name      UIExtensionSamples_ListKeyOf_0021
     * @tc.desc      listKeyOf(item=" _1") returns " _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0021 begin`);
      const actual: string = listKeyOf(' _1');
      logInfo(`listKeyOf(item=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _1');
      logInfo(`${BUNDLE}ListKeyOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0022
     * @tc.name      UIExtensionSamples_ListKeyOf_0022
     * @tc.desc      listKeyOf(item="x ") returns "x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0022 begin`);
      const actual: string = listKeyOf('x ');
      logInfo(`listKeyOf(item="x "): actual=${actual}`);
      expect(actual).assertEqual('x ');
      logInfo(`${BUNDLE}ListKeyOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0023
     * @tc.name      UIExtensionSamples_ListKeyOf_0023
     * @tc.desc      listKeyOf(item=" 123 ") returns " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0023 begin`);
      const actual: string = listKeyOf(' 123 ');
      logInfo(`listKeyOf(item=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123 ');
      logInfo(`${BUNDLE}ListKeyOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0024
     * @tc.name      UIExtensionSamples_ListKeyOf_0024
     * @tc.desc      listKeyOf(item="123123") returns "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0024 begin`);
      const actual: string = listKeyOf('123123');
      logInfo(`listKeyOf(item="123123"): actual=${actual}`);
      expect(actual).assertEqual('123123');
      logInfo(`${BUNDLE}ListKeyOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0025
     * @tc.name      UIExtensionSamples_ListKeyOf_0025
     * @tc.desc      listKeyOf(item="123_1") returns "123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0025 begin`);
      const actual: string = listKeyOf('123_1');
      logInfo(`listKeyOf(item="123_1"): actual=${actual}`);
      expect(actual).assertEqual('123_1');
      logInfo(`${BUNDLE}ListKeyOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0026
     * @tc.name      UIExtensionSamples_ListKeyOf_0026
     * @tc.desc      listKeyOf(item="x123") returns "x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ListKeyOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListKeyOf_0026 begin`);
      const actual: string = listKeyOf('x123');
      logInfo(`listKeyOf(item="x123"): actual=${actual}`);
      expect(actual).assertEqual('x123');
      logInfo(`${BUNDLE}ListKeyOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0027
     * @tc.name      UIExtensionSamples_ListKeyOf_0027
     * @tc.desc      listKeyOf(item="pTvqM2Tg") returns "pTvqM2Tg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0027 begin`);
      const actual: string = listKeyOf('pTvqM2Tg');
      logInfo(`listKeyOf(item="pTvqM2Tg"): actual=${actual}`);
      expect(actual).assertEqual('pTvqM2Tg');
      logInfo(`${BUNDLE}ListKeyOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0028
     * @tc.name      UIExtensionSamples_ListKeyOf_0028
     * @tc.desc      listKeyOf(item="HNQ0j") returns "HNQ0j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0028 begin`);
      const actual: string = listKeyOf('HNQ0j');
      logInfo(`listKeyOf(item="HNQ0j"): actual=${actual}`);
      expect(actual).assertEqual('HNQ0j');
      logInfo(`${BUNDLE}ListKeyOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0029
     * @tc.name      UIExtensionSamples_ListKeyOf_0029
     * @tc.desc      listKeyOf(item="2ZdwAUGc") returns "2ZdwAUGc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0029 begin`);
      const actual: string = listKeyOf('2ZdwAUGc');
      logInfo(`listKeyOf(item="2ZdwAUGc"): actual=${actual}`);
      expect(actual).assertEqual('2ZdwAUGc');
      logInfo(`${BUNDLE}ListKeyOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0030
     * @tc.name      UIExtensionSamples_ListKeyOf_0030
     * @tc.desc      listKeyOf(item="n50E") returns "n50E"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0030 begin`);
      const actual: string = listKeyOf('n50E');
      logInfo(`listKeyOf(item="n50E"): actual=${actual}`);
      expect(actual).assertEqual('n50E');
      logInfo(`${BUNDLE}ListKeyOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0031
     * @tc.name      UIExtensionSamples_ListKeyOf_0031
     * @tc.desc      listKeyOf(item="vC9T2x8TLV") returns "vC9T2x8TLV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0031 begin`);
      const actual: string = listKeyOf('vC9T2x8TLV');
      logInfo(`listKeyOf(item="vC9T2x8TLV"): actual=${actual}`);
      expect(actual).assertEqual('vC9T2x8TLV');
      logInfo(`${BUNDLE}ListKeyOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0032
     * @tc.name      UIExtensionSamples_ListKeyOf_0032
     * @tc.desc      listKeyOf(item="5XGO759Ji") returns "5XGO759Ji"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0032 begin`);
      const actual: string = listKeyOf('5XGO759Ji');
      logInfo(`listKeyOf(item="5XGO759Ji"): actual=${actual}`);
      expect(actual).assertEqual('5XGO759Ji');
      logInfo(`${BUNDLE}ListKeyOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0033
     * @tc.name      UIExtensionSamples_ListKeyOf_0033
     * @tc.desc      listKeyOf(item="YaRyDcJy") returns "YaRyDcJy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0033 begin`);
      const actual: string = listKeyOf('YaRyDcJy');
      logInfo(`listKeyOf(item="YaRyDcJy"): actual=${actual}`);
      expect(actual).assertEqual('YaRyDcJy');
      logInfo(`${BUNDLE}ListKeyOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0034
     * @tc.name      UIExtensionSamples_ListKeyOf_0034
     * @tc.desc      listKeyOf(item="eRTHn") returns "eRTHn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0034 begin`);
      const actual: string = listKeyOf('eRTHn');
      logInfo(`listKeyOf(item="eRTHn"): actual=${actual}`);
      expect(actual).assertEqual('eRTHn');
      logInfo(`${BUNDLE}ListKeyOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0035
     * @tc.name      UIExtensionSamples_ListKeyOf_0035
     * @tc.desc      listKeyOf(item="br41JXIW") returns "br41JXIW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0035 begin`);
      const actual: string = listKeyOf('br41JXIW');
      logInfo(`listKeyOf(item="br41JXIW"): actual=${actual}`);
      expect(actual).assertEqual('br41JXIW');
      logInfo(`${BUNDLE}ListKeyOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0036
     * @tc.name      UIExtensionSamples_ListKeyOf_0036
     * @tc.desc      listKeyOf(item="k7QWV3pA76M") returns "k7QWV3pA76M"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0036 begin`);
      const actual: string = listKeyOf('k7QWV3pA76M');
      logInfo(`listKeyOf(item="k7QWV3pA76M"): actual=${actual}`);
      expect(actual).assertEqual('k7QWV3pA76M');
      logInfo(`${BUNDLE}ListKeyOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0037
     * @tc.name      UIExtensionSamples_ListKeyOf_0037
     * @tc.desc      listKeyOf(item="iBALVOT54xqg") returns "iBALVOT54xqg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0037 begin`);
      const actual: string = listKeyOf('iBALVOT54xqg');
      logInfo(`listKeyOf(item="iBALVOT54xqg"): actual=${actual}`);
      expect(actual).assertEqual('iBALVOT54xqg');
      logInfo(`${BUNDLE}ListKeyOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0038
     * @tc.name      UIExtensionSamples_ListKeyOf_0038
     * @tc.desc      listKeyOf(item="PUcYsl7Sn") returns "PUcYsl7Sn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0038 begin`);
      const actual: string = listKeyOf('PUcYsl7Sn');
      logInfo(`listKeyOf(item="PUcYsl7Sn"): actual=${actual}`);
      expect(actual).assertEqual('PUcYsl7Sn');
      logInfo(`${BUNDLE}ListKeyOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0039
     * @tc.name      UIExtensionSamples_ListKeyOf_0039
     * @tc.desc      listKeyOf(item="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0039 begin`);
      const actual: string = listKeyOf('x');
      logInfo(`listKeyOf(item="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ListKeyOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0040
     * @tc.name      UIExtensionSamples_ListKeyOf_0040
     * @tc.desc      listKeyOf(item="rd1PxvVqeg3z") returns "rd1PxvVqeg3z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0040 begin`);
      const actual: string = listKeyOf('rd1PxvVqeg3z');
      logInfo(`listKeyOf(item="rd1PxvVqeg3z"): actual=${actual}`);
      expect(actual).assertEqual('rd1PxvVqeg3z');
      logInfo(`${BUNDLE}ListKeyOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0041
     * @tc.name      UIExtensionSamples_ListKeyOf_0041
     * @tc.desc      listKeyOf(item="S6") returns "S6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0041 begin`);
      const actual: string = listKeyOf('S6');
      logInfo(`listKeyOf(item="S6"): actual=${actual}`);
      expect(actual).assertEqual('S6');
      logInfo(`${BUNDLE}ListKeyOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0042
     * @tc.name      UIExtensionSamples_ListKeyOf_0042
     * @tc.desc      listKeyOf(item="08tnvfg") returns "08tnvfg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0042 begin`);
      const actual: string = listKeyOf('08tnvfg');
      logInfo(`listKeyOf(item="08tnvfg"): actual=${actual}`);
      expect(actual).assertEqual('08tnvfg');
      logInfo(`${BUNDLE}ListKeyOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0043
     * @tc.name      UIExtensionSamples_ListKeyOf_0043
     * @tc.desc      listKeyOf(item="pT4") returns "pT4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0043 begin`);
      const actual: string = listKeyOf('pT4');
      logInfo(`listKeyOf(item="pT4"): actual=${actual}`);
      expect(actual).assertEqual('pT4');
      logInfo(`${BUNDLE}ListKeyOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0044
     * @tc.name      UIExtensionSamples_ListKeyOf_0044
     * @tc.desc      listKeyOf(item="SAi8zO1ik") returns "SAi8zO1ik"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0044 begin`);
      const actual: string = listKeyOf('SAi8zO1ik');
      logInfo(`listKeyOf(item="SAi8zO1ik"): actual=${actual}`);
      expect(actual).assertEqual('SAi8zO1ik');
      logInfo(`${BUNDLE}ListKeyOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0045
     * @tc.name      UIExtensionSamples_ListKeyOf_0045
     * @tc.desc      listKeyOf(item="dTRoRDGbjH24") returns "dTRoRDGbjH24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0045 begin`);
      const actual: string = listKeyOf('dTRoRDGbjH24');
      logInfo(`listKeyOf(item="dTRoRDGbjH24"): actual=${actual}`);
      expect(actual).assertEqual('dTRoRDGbjH24');
      logInfo(`${BUNDLE}ListKeyOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0046
     * @tc.name      UIExtensionSamples_ListKeyOf_0046
     * @tc.desc      listKeyOf(item="CAAj") returns "CAAj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0046 begin`);
      const actual: string = listKeyOf('CAAj');
      logInfo(`listKeyOf(item="CAAj"): actual=${actual}`);
      expect(actual).assertEqual('CAAj');
      logInfo(`${BUNDLE}ListKeyOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0047
     * @tc.name      UIExtensionSamples_ListKeyOf_0047
     * @tc.desc      listKeyOf(item="mLfWbu") returns "mLfWbu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0047 begin`);
      const actual: string = listKeyOf('mLfWbu');
      logInfo(`listKeyOf(item="mLfWbu"): actual=${actual}`);
      expect(actual).assertEqual('mLfWbu');
      logInfo(`${BUNDLE}ListKeyOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0048
     * @tc.name      UIExtensionSamples_ListKeyOf_0048
     * @tc.desc      listKeyOf(item="2Ma0M7t") returns "2Ma0M7t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0048 begin`);
      const actual: string = listKeyOf('2Ma0M7t');
      logInfo(`listKeyOf(item="2Ma0M7t"): actual=${actual}`);
      expect(actual).assertEqual('2Ma0M7t');
      logInfo(`${BUNDLE}ListKeyOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0049
     * @tc.name      UIExtensionSamples_ListKeyOf_0049
     * @tc.desc      listKeyOf(item="55vH") returns "55vH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0049 begin`);
      const actual: string = listKeyOf('55vH');
      logInfo(`listKeyOf(item="55vH"): actual=${actual}`);
      expect(actual).assertEqual('55vH');
      logInfo(`${BUNDLE}ListKeyOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0050
     * @tc.name      UIExtensionSamples_ListKeyOf_0050
     * @tc.desc      listKeyOf(item="zMMP") returns "zMMP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0050 begin`);
      const actual: string = listKeyOf('zMMP');
      logInfo(`listKeyOf(item="zMMP"): actual=${actual}`);
      expect(actual).assertEqual('zMMP');
      logInfo(`${BUNDLE}ListKeyOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0051
     * @tc.name      UIExtensionSamples_ListKeyOf_0051
     * @tc.desc      listKeyOf(item="Y") returns "Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0051 begin`);
      const actual: string = listKeyOf('Y');
      logInfo(`listKeyOf(item="Y"): actual=${actual}`);
      expect(actual).assertEqual('Y');
      logInfo(`${BUNDLE}ListKeyOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0052
     * @tc.name      UIExtensionSamples_ListKeyOf_0052
     * @tc.desc      listKeyOf(item="iRp") returns "iRp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0052 begin`);
      const actual: string = listKeyOf('iRp');
      logInfo(`listKeyOf(item="iRp"): actual=${actual}`);
      expect(actual).assertEqual('iRp');
      logInfo(`${BUNDLE}ListKeyOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0053
     * @tc.name      UIExtensionSamples_ListKeyOf_0053
     * @tc.desc      listKeyOf(item="qhviQmwip") returns "qhviQmwip"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0053 begin`);
      const actual: string = listKeyOf('qhviQmwip');
      logInfo(`listKeyOf(item="qhviQmwip"): actual=${actual}`);
      expect(actual).assertEqual('qhviQmwip');
      logInfo(`${BUNDLE}ListKeyOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0054
     * @tc.name      UIExtensionSamples_ListKeyOf_0054
     * @tc.desc      listKeyOf(item="VCHt") returns "VCHt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0054 begin`);
      const actual: string = listKeyOf('VCHt');
      logInfo(`listKeyOf(item="VCHt"): actual=${actual}`);
      expect(actual).assertEqual('VCHt');
      logInfo(`${BUNDLE}ListKeyOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0055
     * @tc.name      UIExtensionSamples_ListKeyOf_0055
     * @tc.desc      listKeyOf(item="woSG") returns "woSG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0055 begin`);
      const actual: string = listKeyOf('woSG');
      logInfo(`listKeyOf(item="woSG"): actual=${actual}`);
      expect(actual).assertEqual('woSG');
      logInfo(`${BUNDLE}ListKeyOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0056
     * @tc.name      UIExtensionSamples_ListKeyOf_0056
     * @tc.desc      listKeyOf(item="Bft4On0") returns "Bft4On0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0056 begin`);
      const actual: string = listKeyOf('Bft4On0');
      logInfo(`listKeyOf(item="Bft4On0"): actual=${actual}`);
      expect(actual).assertEqual('Bft4On0');
      logInfo(`${BUNDLE}ListKeyOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0057
     * @tc.name      UIExtensionSamples_ListKeyOf_0057
     * @tc.desc      listKeyOf(item="bSv7") returns "bSv7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0057 begin`);
      const actual: string = listKeyOf('bSv7');
      logInfo(`listKeyOf(item="bSv7"): actual=${actual}`);
      expect(actual).assertEqual('bSv7');
      logInfo(`${BUNDLE}ListKeyOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0058
     * @tc.name      UIExtensionSamples_ListKeyOf_0058
     * @tc.desc      listKeyOf(item="E3d64tofi") returns "E3d64tofi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0058 begin`);
      const actual: string = listKeyOf('E3d64tofi');
      logInfo(`listKeyOf(item="E3d64tofi"): actual=${actual}`);
      expect(actual).assertEqual('E3d64tofi');
      logInfo(`${BUNDLE}ListKeyOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0059
     * @tc.name      UIExtensionSamples_ListKeyOf_0059
     * @tc.desc      listKeyOf(item="YC6ZXrZbv4j") returns "YC6ZXrZbv4j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0059 begin`);
      const actual: string = listKeyOf('YC6ZXrZbv4j');
      logInfo(`listKeyOf(item="YC6ZXrZbv4j"): actual=${actual}`);
      expect(actual).assertEqual('YC6ZXrZbv4j');
      logInfo(`${BUNDLE}ListKeyOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0060
     * @tc.name      UIExtensionSamples_ListKeyOf_0060
     * @tc.desc      listKeyOf(item="wR") returns "wR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0060 begin`);
      const actual: string = listKeyOf('wR');
      logInfo(`listKeyOf(item="wR"): actual=${actual}`);
      expect(actual).assertEqual('wR');
      logInfo(`${BUNDLE}ListKeyOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0061
     * @tc.name      UIExtensionSamples_ListKeyOf_0061
     * @tc.desc      listKeyOf(item="07Aazavs6d") returns "07Aazavs6d"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0061 begin`);
      const actual: string = listKeyOf('07Aazavs6d');
      logInfo(`listKeyOf(item="07Aazavs6d"): actual=${actual}`);
      expect(actual).assertEqual('07Aazavs6d');
      logInfo(`${BUNDLE}ListKeyOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0062
     * @tc.name      UIExtensionSamples_ListKeyOf_0062
     * @tc.desc      listKeyOf(item="gYyvi4JQHjUJ") returns "gYyvi4JQHjUJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0062 begin`);
      const actual: string = listKeyOf('gYyvi4JQHjUJ');
      logInfo(`listKeyOf(item="gYyvi4JQHjUJ"): actual=${actual}`);
      expect(actual).assertEqual('gYyvi4JQHjUJ');
      logInfo(`${BUNDLE}ListKeyOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0063
     * @tc.name      UIExtensionSamples_ListKeyOf_0063
     * @tc.desc      listKeyOf(item="zmFYssprtH") returns "zmFYssprtH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0063 begin`);
      const actual: string = listKeyOf('zmFYssprtH');
      logInfo(`listKeyOf(item="zmFYssprtH"): actual=${actual}`);
      expect(actual).assertEqual('zmFYssprtH');
      logInfo(`${BUNDLE}ListKeyOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0064
     * @tc.name      UIExtensionSamples_ListKeyOf_0064
     * @tc.desc      listKeyOf(item="m8dvoJfe") returns "m8dvoJfe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0064 begin`);
      const actual: string = listKeyOf('m8dvoJfe');
      logInfo(`listKeyOf(item="m8dvoJfe"): actual=${actual}`);
      expect(actual).assertEqual('m8dvoJfe');
      logInfo(`${BUNDLE}ListKeyOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0065
     * @tc.name      UIExtensionSamples_ListKeyOf_0065
     * @tc.desc      listKeyOf(item="WasTAMHH8s") returns "WasTAMHH8s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0065 begin`);
      const actual: string = listKeyOf('WasTAMHH8s');
      logInfo(`listKeyOf(item="WasTAMHH8s"): actual=${actual}`);
      expect(actual).assertEqual('WasTAMHH8s');
      logInfo(`${BUNDLE}ListKeyOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0066
     * @tc.name      UIExtensionSamples_ListKeyOf_0066
     * @tc.desc      listKeyOf(item="UrKZI9VTf") returns "UrKZI9VTf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0066 begin`);
      const actual: string = listKeyOf('UrKZI9VTf');
      logInfo(`listKeyOf(item="UrKZI9VTf"): actual=${actual}`);
      expect(actual).assertEqual('UrKZI9VTf');
      logInfo(`${BUNDLE}ListKeyOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0067
     * @tc.name      UIExtensionSamples_ListKeyOf_0067
     * @tc.desc      listKeyOf(item="dGwzAom6") returns "dGwzAom6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0067 begin`);
      const actual: string = listKeyOf('dGwzAom6');
      logInfo(`listKeyOf(item="dGwzAom6"): actual=${actual}`);
      expect(actual).assertEqual('dGwzAom6');
      logInfo(`${BUNDLE}ListKeyOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0068
     * @tc.name      UIExtensionSamples_ListKeyOf_0068
     * @tc.desc      listKeyOf(item="XjZp7ZGZz") returns "XjZp7ZGZz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0068 begin`);
      const actual: string = listKeyOf('XjZp7ZGZz');
      logInfo(`listKeyOf(item="XjZp7ZGZz"): actual=${actual}`);
      expect(actual).assertEqual('XjZp7ZGZz');
      logInfo(`${BUNDLE}ListKeyOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0069
     * @tc.name      UIExtensionSamples_ListKeyOf_0069
     * @tc.desc      listKeyOf(item="yjC4Z") returns "yjC4Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0069 begin`);
      const actual: string = listKeyOf('yjC4Z');
      logInfo(`listKeyOf(item="yjC4Z"): actual=${actual}`);
      expect(actual).assertEqual('yjC4Z');
      logInfo(`${BUNDLE}ListKeyOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0070
     * @tc.name      UIExtensionSamples_ListKeyOf_0070
     * @tc.desc      listKeyOf(item="CtjmAUMcHcA") returns "CtjmAUMcHcA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0070 begin`);
      const actual: string = listKeyOf('CtjmAUMcHcA');
      logInfo(`listKeyOf(item="CtjmAUMcHcA"): actual=${actual}`);
      expect(actual).assertEqual('CtjmAUMcHcA');
      logInfo(`${BUNDLE}ListKeyOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0071
     * @tc.name      UIExtensionSamples_ListKeyOf_0071
     * @tc.desc      listKeyOf(item="uwRC") returns "uwRC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0071 begin`);
      const actual: string = listKeyOf('uwRC');
      logInfo(`listKeyOf(item="uwRC"): actual=${actual}`);
      expect(actual).assertEqual('uwRC');
      logInfo(`${BUNDLE}ListKeyOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0072
     * @tc.name      UIExtensionSamples_ListKeyOf_0072
     * @tc.desc      listKeyOf(item="r") returns "r"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0072 begin`);
      const actual: string = listKeyOf('r');
      logInfo(`listKeyOf(item="r"): actual=${actual}`);
      expect(actual).assertEqual('r');
      logInfo(`${BUNDLE}ListKeyOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0073
     * @tc.name      UIExtensionSamples_ListKeyOf_0073
     * @tc.desc      listKeyOf(item="bRouLx") returns "bRouLx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0073 begin`);
      const actual: string = listKeyOf('bRouLx');
      logInfo(`listKeyOf(item="bRouLx"): actual=${actual}`);
      expect(actual).assertEqual('bRouLx');
      logInfo(`${BUNDLE}ListKeyOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0074
     * @tc.name      UIExtensionSamples_ListKeyOf_0074
     * @tc.desc      listKeyOf(item="2MJNfX7") returns "2MJNfX7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0074 begin`);
      const actual: string = listKeyOf('2MJNfX7');
      logInfo(`listKeyOf(item="2MJNfX7"): actual=${actual}`);
      expect(actual).assertEqual('2MJNfX7');
      logInfo(`${BUNDLE}ListKeyOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0075
     * @tc.name      UIExtensionSamples_ListKeyOf_0075
     * @tc.desc      listKeyOf(item="8fJfriJUHibW") returns "8fJfriJUHibW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0075 begin`);
      const actual: string = listKeyOf('8fJfriJUHibW');
      logInfo(`listKeyOf(item="8fJfriJUHibW"): actual=${actual}`);
      expect(actual).assertEqual('8fJfriJUHibW');
      logInfo(`${BUNDLE}ListKeyOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0076
     * @tc.name      UIExtensionSamples_ListKeyOf_0076
     * @tc.desc      listKeyOf(item="fJkaSVT") returns "fJkaSVT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0076 begin`);
      const actual: string = listKeyOf('fJkaSVT');
      logInfo(`listKeyOf(item="fJkaSVT"): actual=${actual}`);
      expect(actual).assertEqual('fJkaSVT');
      logInfo(`${BUNDLE}ListKeyOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0077
     * @tc.name      UIExtensionSamples_ListKeyOf_0077
     * @tc.desc      listKeyOf(item="EADCsd") returns "EADCsd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0077 begin`);
      const actual: string = listKeyOf('EADCsd');
      logInfo(`listKeyOf(item="EADCsd"): actual=${actual}`);
      expect(actual).assertEqual('EADCsd');
      logInfo(`${BUNDLE}ListKeyOf_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0078
     * @tc.name      UIExtensionSamples_ListKeyOf_0078
     * @tc.desc      listKeyOf(item="SDmTh") returns "SDmTh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0078 begin`);
      const actual: string = listKeyOf('SDmTh');
      logInfo(`listKeyOf(item="SDmTh"): actual=${actual}`);
      expect(actual).assertEqual('SDmTh');
      logInfo(`${BUNDLE}ListKeyOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0079
     * @tc.name      UIExtensionSamples_ListKeyOf_0079
     * @tc.desc      listKeyOf(item="pFNcUeY") returns "pFNcUeY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0079 begin`);
      const actual: string = listKeyOf('pFNcUeY');
      logInfo(`listKeyOf(item="pFNcUeY"): actual=${actual}`);
      expect(actual).assertEqual('pFNcUeY');
      logInfo(`${BUNDLE}ListKeyOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0080
     * @tc.name      UIExtensionSamples_ListKeyOf_0080
     * @tc.desc      listKeyOf(item="WG8") returns "WG8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0080 begin`);
      const actual: string = listKeyOf('WG8');
      logInfo(`listKeyOf(item="WG8"): actual=${actual}`);
      expect(actual).assertEqual('WG8');
      logInfo(`${BUNDLE}ListKeyOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0081
     * @tc.name      UIExtensionSamples_ListKeyOf_0081
     * @tc.desc      listKeyOf(item="gTkh2") returns "gTkh2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0081 begin`);
      const actual: string = listKeyOf('gTkh2');
      logInfo(`listKeyOf(item="gTkh2"): actual=${actual}`);
      expect(actual).assertEqual('gTkh2');
      logInfo(`${BUNDLE}ListKeyOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0082
     * @tc.name      UIExtensionSamples_ListKeyOf_0082
     * @tc.desc      listKeyOf(item="YNgvxTN1Hn") returns "YNgvxTN1Hn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0082 begin`);
      const actual: string = listKeyOf('YNgvxTN1Hn');
      logInfo(`listKeyOf(item="YNgvxTN1Hn"): actual=${actual}`);
      expect(actual).assertEqual('YNgvxTN1Hn');
      logInfo(`${BUNDLE}ListKeyOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0083
     * @tc.name      UIExtensionSamples_ListKeyOf_0083
     * @tc.desc      listKeyOf(item="FaNShUjUj1jn") returns "FaNShUjUj1jn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0083 begin`);
      const actual: string = listKeyOf('FaNShUjUj1jn');
      logInfo(`listKeyOf(item="FaNShUjUj1jn"): actual=${actual}`);
      expect(actual).assertEqual('FaNShUjUj1jn');
      logInfo(`${BUNDLE}ListKeyOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0084
     * @tc.name      UIExtensionSamples_ListKeyOf_0084
     * @tc.desc      listKeyOf(item="9") returns "9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0084 begin`);
      const actual: string = listKeyOf('9');
      logInfo(`listKeyOf(item="9"): actual=${actual}`);
      expect(actual).assertEqual('9');
      logInfo(`${BUNDLE}ListKeyOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0085
     * @tc.name      UIExtensionSamples_ListKeyOf_0085
     * @tc.desc      listKeyOf(item="m") returns "m"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0085 begin`);
      const actual: string = listKeyOf('m');
      logInfo(`listKeyOf(item="m"): actual=${actual}`);
      expect(actual).assertEqual('m');
      logInfo(`${BUNDLE}ListKeyOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0086
     * @tc.name      UIExtensionSamples_ListKeyOf_0086
     * @tc.desc      listKeyOf(item="38cr6h6") returns "38cr6h6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0086 begin`);
      const actual: string = listKeyOf('38cr6h6');
      logInfo(`listKeyOf(item="38cr6h6"): actual=${actual}`);
      expect(actual).assertEqual('38cr6h6');
      logInfo(`${BUNDLE}ListKeyOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0087
     * @tc.name      UIExtensionSamples_ListKeyOf_0087
     * @tc.desc      listKeyOf(item="kB2KYwwPSU") returns "kB2KYwwPSU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0087 begin`);
      const actual: string = listKeyOf('kB2KYwwPSU');
      logInfo(`listKeyOf(item="kB2KYwwPSU"): actual=${actual}`);
      expect(actual).assertEqual('kB2KYwwPSU');
      logInfo(`${BUNDLE}ListKeyOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0088
     * @tc.name      UIExtensionSamples_ListKeyOf_0088
     * @tc.desc      listKeyOf(item="B1704g") returns "B1704g"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0088 begin`);
      const actual: string = listKeyOf('B1704g');
      logInfo(`listKeyOf(item="B1704g"): actual=${actual}`);
      expect(actual).assertEqual('B1704g');
      logInfo(`${BUNDLE}ListKeyOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0089
     * @tc.name      UIExtensionSamples_ListKeyOf_0089
     * @tc.desc      listKeyOf(item="ZDCL") returns "ZDCL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0089 begin`);
      const actual: string = listKeyOf('ZDCL');
      logInfo(`listKeyOf(item="ZDCL"): actual=${actual}`);
      expect(actual).assertEqual('ZDCL');
      logInfo(`${BUNDLE}ListKeyOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_LIST_KEY_OF_0090
     * @tc.name      UIExtensionSamples_ListKeyOf_0090
     * @tc.desc      listKeyOf(item="jcG") returns "jcG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ListKeyOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListKeyOf_0090 begin`);
      const actual: string = listKeyOf('jcG');
      logInfo(`listKeyOf(item="jcG"): actual=${actual}`);
      expect(actual).assertEqual('jcG');
      logInfo(`${BUNDLE}ListKeyOf_0090 end`);
    });
  });
}
