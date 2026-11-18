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
import { showsNoResultToast } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for showsNoResultToast (50 cases). */
export default function showsNoResultToastTest(): void {
  describe('ShowsNoResultToastTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0001
     * @tc.name      CitySearch_ShowsNoResultToast_0001
     * @tc.desc      showsNoResultToast(value="Hello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_ShowsNoResultToast_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0001 begin`);
      const actual: boolean = showsNoResultToast('Hello');
      logInfo(`showsNoResultToast(value="Hello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0002
     * @tc.name      CitySearch_ShowsNoResultToast_0002
     * @tc.desc      showsNoResultToast(value="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_ShowsNoResultToast_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0002 begin`);
      const actual: boolean = showsNoResultToast('A');
      logInfo(`showsNoResultToast(value="A"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsNoResultToast_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0003
     * @tc.name      CitySearch_ShowsNoResultToast_0003
     * @tc.desc      showsNoResultToast(value="hello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0003 begin`);
      const actual: boolean = showsNoResultToast('hello world');
      logInfo(`showsNoResultToast(value="hello world"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0004
     * @tc.name      CitySearch_ShowsNoResultToast_0004
     * @tc.desc      showsNoResultToast(value="") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0004 begin`);
      const actual: boolean = showsNoResultToast('');
      logInfo(`showsNoResultToast(value=""): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0005
     * @tc.name      CitySearch_ShowsNoResultToast_0005
     * @tc.desc      showsNoResultToast(value=" ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0005 begin`);
      const actual: boolean = showsNoResultToast(' ');
      logInfo(`showsNoResultToast(value=" "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0006
     * @tc.name      CitySearch_ShowsNoResultToast_0006
     * @tc.desc      showsNoResultToast(value="Sample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0006 begin`);
      const actual: boolean = showsNoResultToast('Sample Title 123');
      logInfo(`showsNoResultToast(value="Sample Title 123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0007
     * @tc.name      CitySearch_ShowsNoResultToast_0007
     * @tc.desc      showsNoResultToast(value="??") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0007 begin`);
      const actual: boolean = showsNoResultToast('\u4e2d\u6587');
      logInfo(`showsNoResultToast(value="??"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0008
     * @tc.name      CitySearch_ShowsNoResultToast_0008
     * @tc.desc      showsNoResultToast(value="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0008 begin`);
      const actual: boolean = showsNoResultToast('a');
      logInfo(`showsNoResultToast(value="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsNoResultToast_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0009
     * @tc.name      CitySearch_ShowsNoResultToast_0009
     * @tc.desc      showsNoResultToast(value="abc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0009 begin`);
      const actual: boolean = showsNoResultToast('abc');
      logInfo(`showsNoResultToast(value="abc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0010
     * @tc.name      CitySearch_ShowsNoResultToast_0010
     * @tc.desc      showsNoResultToast(value="Hello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0010 begin`);
      const actual: boolean = showsNoResultToast('Hello World');
      logInfo(`showsNoResultToast(value="Hello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0011
     * @tc.name      CitySearch_ShowsNoResultToast_0011
     * @tc.desc      showsNoResultToast(value="123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0011 begin`);
      const actual: boolean = showsNoResultToast('123');
      logInfo(`showsNoResultToast(value="123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0012
     * @tc.name      CitySearch_ShowsNoResultToast_0012
     * @tc.desc      showsNoResultToast(value=" Hello ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0012 begin`);
      const actual: boolean = showsNoResultToast(' Hello ');
      logInfo(`showsNoResultToast(value=" Hello "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0013
     * @tc.name      CitySearch_ShowsNoResultToast_0013
     * @tc.desc      showsNoResultToast(value="HelloHello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0013 begin`);
      const actual: boolean = showsNoResultToast('HelloHello');
      logInfo(`showsNoResultToast(value="HelloHello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0014
     * @tc.name      CitySearch_ShowsNoResultToast_0014
     * @tc.desc      showsNoResultToast(value="Hello_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0014 begin`);
      const actual: boolean = showsNoResultToast('Hello_1');
      logInfo(`showsNoResultToast(value="Hello_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0015
     * @tc.name      CitySearch_ShowsNoResultToast_0015
     * @tc.desc      showsNoResultToast(value="xHello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0015 begin`);
      const actual: boolean = showsNoResultToast('xHello');
      logInfo(`showsNoResultToast(value="xHello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0016
     * @tc.name      CitySearch_ShowsNoResultToast_0016
     * @tc.desc      showsNoResultToast(value=" hello world ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0016 begin`);
      const actual: boolean = showsNoResultToast(' hello world ');
      logInfo(`showsNoResultToast(value=" hello world "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0017
     * @tc.name      CitySearch_ShowsNoResultToast_0017
     * @tc.desc      showsNoResultToast(value="hello worldhello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0017 begin`);
      const actual: boolean = showsNoResultToast('hello worldhello world');
      logInfo(`showsNoResultToast(value="hello worldhell...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0018
     * @tc.name      CitySearch_ShowsNoResultToast_0018
     * @tc.desc      showsNoResultToast(value="hello world_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0018 begin`);
      const actual: boolean = showsNoResultToast('hello world_1');
      logInfo(`showsNoResultToast(value="hello world_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0019
     * @tc.name      CitySearch_ShowsNoResultToast_0019
     * @tc.desc      showsNoResultToast(value="xhello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0019 begin`);
      const actual: boolean = showsNoResultToast('xhello world');
      logInfo(`showsNoResultToast(value="xhello world"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0020
     * @tc.name      CitySearch_ShowsNoResultToast_0020
     * @tc.desc      showsNoResultToast(value="   ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0020 begin`);
      const actual: boolean = showsNoResultToast('   ');
      logInfo(`showsNoResultToast(value="   "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0021
     * @tc.name      CitySearch_ShowsNoResultToast_0021
     * @tc.desc      showsNoResultToast(value="  ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0021 begin`);
      const actual: boolean = showsNoResultToast('  ');
      logInfo(`showsNoResultToast(value="  "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0022
     * @tc.name      CitySearch_ShowsNoResultToast_0022
     * @tc.desc      showsNoResultToast(value=" _1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0022 begin`);
      const actual: boolean = showsNoResultToast(' _1');
      logInfo(`showsNoResultToast(value=" _1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0023
     * @tc.name      CitySearch_ShowsNoResultToast_0023
     * @tc.desc      showsNoResultToast(value="x ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0023 begin`);
      const actual: boolean = showsNoResultToast('x ');
      logInfo(`showsNoResultToast(value="x "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0024
     * @tc.name      CitySearch_ShowsNoResultToast_0024
     * @tc.desc      showsNoResultToast(value=" A ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0024 begin`);
      const actual: boolean = showsNoResultToast(' A ');
      logInfo(`showsNoResultToast(value=" A "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0025
     * @tc.name      CitySearch_ShowsNoResultToast_0025
     * @tc.desc      showsNoResultToast(value="AA") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0025 begin`);
      const actual: boolean = showsNoResultToast('AA');
      logInfo(`showsNoResultToast(value="AA"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0026
     * @tc.name      CitySearch_ShowsNoResultToast_0026
     * @tc.desc      showsNoResultToast(value="A_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0026 begin`);
      const actual: boolean = showsNoResultToast('A_1');
      logInfo(`showsNoResultToast(value="A_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0027
     * @tc.name      CitySearch_ShowsNoResultToast_0027
     * @tc.desc      showsNoResultToast(value="xA") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0027 begin`);
      const actual: boolean = showsNoResultToast('xA');
      logInfo(`showsNoResultToast(value="xA"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0028
     * @tc.name      CitySearch_ShowsNoResultToast_0028
     * @tc.desc      showsNoResultToast(value=" Sample Title 123 ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0028 begin`);
      const actual: boolean = showsNoResultToast(' Sample Title 123 ');
      logInfo(`showsNoResultToast(value=" Sample Title 1...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0029
     * @tc.name      CitySearch_ShowsNoResultToast_0029
     * @tc.desc      showsNoResultToast(value="Sample Title 123Sample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0029 begin`);
      const actual: boolean = showsNoResultToast('Sample Title 123Sample Title 123');
      logInfo(`showsNoResultToast(value="Sample Title 12...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0030
     * @tc.name      CitySearch_ShowsNoResultToast_0030
     * @tc.desc      showsNoResultToast(value="Sample Title 123_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0030 begin`);
      const actual: boolean = showsNoResultToast('Sample Title 123_1');
      logInfo(`showsNoResultToast(value="Sample Title 12...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0031
     * @tc.name      CitySearch_ShowsNoResultToast_0031
     * @tc.desc      showsNoResultToast(value="xSample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0031 begin`);
      const actual: boolean = showsNoResultToast('xSample Title 123');
      logInfo(`showsNoResultToast(value="xSample Title 1...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0032
     * @tc.name      CitySearch_ShowsNoResultToast_0032
     * @tc.desc      showsNoResultToast(value=" ?? ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0032 begin`);
      const actual: boolean = showsNoResultToast(' \u4e2d\u6587 ');
      logInfo(`showsNoResultToast(value=" ?? "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0033
     * @tc.name      CitySearch_ShowsNoResultToast_0033
     * @tc.desc      showsNoResultToast(value="????") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0033 begin`);
      const actual: boolean = showsNoResultToast('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`showsNoResultToast(value="????"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0034
     * @tc.name      CitySearch_ShowsNoResultToast_0034
     * @tc.desc      showsNoResultToast(value="??_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0034 begin`);
      const actual: boolean = showsNoResultToast('\u4e2d\u6587_1');
      logInfo(`showsNoResultToast(value="??_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0035
     * @tc.name      CitySearch_ShowsNoResultToast_0035
     * @tc.desc      showsNoResultToast(value="x??") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0035 begin`);
      const actual: boolean = showsNoResultToast('x\u4e2d\u6587');
      logInfo(`showsNoResultToast(value="x??"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0036
     * @tc.name      CitySearch_ShowsNoResultToast_0036
     * @tc.desc      showsNoResultToast(value=" a ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0036 begin`);
      const actual: boolean = showsNoResultToast(' a ');
      logInfo(`showsNoResultToast(value=" a "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0037
     * @tc.name      CitySearch_ShowsNoResultToast_0037
     * @tc.desc      showsNoResultToast(value="aa") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0037 begin`);
      const actual: boolean = showsNoResultToast('aa');
      logInfo(`showsNoResultToast(value="aa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0038
     * @tc.name      CitySearch_ShowsNoResultToast_0038
     * @tc.desc      showsNoResultToast(value="a_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0038 begin`);
      const actual: boolean = showsNoResultToast('a_1');
      logInfo(`showsNoResultToast(value="a_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0039
     * @tc.name      CitySearch_ShowsNoResultToast_0039
     * @tc.desc      showsNoResultToast(value="xa") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0039 begin`);
      const actual: boolean = showsNoResultToast('xa');
      logInfo(`showsNoResultToast(value="xa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0040
     * @tc.name      CitySearch_ShowsNoResultToast_0040
     * @tc.desc      showsNoResultToast(value=" abc ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0040 begin`);
      const actual: boolean = showsNoResultToast(' abc ');
      logInfo(`showsNoResultToast(value=" abc "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0041
     * @tc.name      CitySearch_ShowsNoResultToast_0041
     * @tc.desc      showsNoResultToast(value="abcabc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0041 begin`);
      const actual: boolean = showsNoResultToast('abcabc');
      logInfo(`showsNoResultToast(value="abcabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0042
     * @tc.name      CitySearch_ShowsNoResultToast_0042
     * @tc.desc      showsNoResultToast(value="abc_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0042 begin`);
      const actual: boolean = showsNoResultToast('abc_1');
      logInfo(`showsNoResultToast(value="abc_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0043
     * @tc.name      CitySearch_ShowsNoResultToast_0043
     * @tc.desc      showsNoResultToast(value="xabc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0043 begin`);
      const actual: boolean = showsNoResultToast('xabc');
      logInfo(`showsNoResultToast(value="xabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0044
     * @tc.name      CitySearch_ShowsNoResultToast_0044
     * @tc.desc      showsNoResultToast(value=" Hello World ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0044 begin`);
      const actual: boolean = showsNoResultToast(' Hello World ');
      logInfo(`showsNoResultToast(value=" Hello World "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0045
     * @tc.name      CitySearch_ShowsNoResultToast_0045
     * @tc.desc      showsNoResultToast(value="Hello WorldHello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0045 begin`);
      const actual: boolean = showsNoResultToast('Hello WorldHello World');
      logInfo(`showsNoResultToast(value="Hello WorldHell...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0046
     * @tc.name      CitySearch_ShowsNoResultToast_0046
     * @tc.desc      showsNoResultToast(value="Hello World_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0046 begin`);
      const actual: boolean = showsNoResultToast('Hello World_1');
      logInfo(`showsNoResultToast(value="Hello World_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0047
     * @tc.name      CitySearch_ShowsNoResultToast_0047
     * @tc.desc      showsNoResultToast(value="xHello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0047 begin`);
      const actual: boolean = showsNoResultToast('xHello World');
      logInfo(`showsNoResultToast(value="xHello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0048
     * @tc.name      CitySearch_ShowsNoResultToast_0048
     * @tc.desc      showsNoResultToast(value=" 123 ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ShowsNoResultToast_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0048 begin`);
      const actual: boolean = showsNoResultToast(' 123 ');
      logInfo(`showsNoResultToast(value=" 123 "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0049
     * @tc.name      CitySearch_ShowsNoResultToast_0049
     * @tc.desc      showsNoResultToast(value="123123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0049 begin`);
      const actual: boolean = showsNoResultToast('123123');
      logInfo(`showsNoResultToast(value="123123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SHOWS_NO_RESULT_TOAST_0050
     * @tc.name      CitySearch_ShowsNoResultToast_0050
     * @tc.desc      showsNoResultToast(value="123_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ShowsNoResultToast_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsNoResultToast_0050 begin`);
      const actual: boolean = showsNoResultToast('123_1');
      logInfo(`showsNoResultToast(value="123_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsNoResultToast_0050 end`);
    });
  });
}
