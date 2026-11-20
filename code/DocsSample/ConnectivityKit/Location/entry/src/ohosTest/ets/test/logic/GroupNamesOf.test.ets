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
import { yieldToEventLoop } from '../TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { groupNamesOf } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for groupNamesOf (75 cases). */
export default function groupNamesOfTest(): void {
  describe('GroupNamesOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0001
     * @tc.name      Location_GroupNamesOf_0001
     * @tc.desc      groupNamesOf(letter="string") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_GroupNamesOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0001 begin`);
      const actual: string[] = groupNamesOf('string');
      logInfo(`groupNamesOf(letter="string"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0002
     * @tc.name      Location_GroupNamesOf_0002
     * @tc.desc      groupNamesOf(letter="B") returns ["??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_GroupNamesOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0002 begin`);
      const actual: string[] = groupNamesOf('B');
      logInfo(`groupNamesOf(letter="B"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`groupNamesOf(letter="B"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u5317\u4eac"]');
      logInfo(`${BUNDLE}GroupNamesOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0003
     * @tc.name      Location_GroupNamesOf_0003
     * @tc.desc      groupNamesOf(letter="H") returns ["???","??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0003 begin`);
      const actual: string[] = groupNamesOf('H');
      logInfo(`groupNamesOf(letter="H"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`groupNamesOf(letter="H"): JSON.stringify(actual.slice(0, 3))=${JSON.stringify(actual.slice(0, 3))}`);
      expect(JSON.stringify(actual.slice(0, 3))).assertEqual('["\u6d77\u5357","\u6cb3\u5317","\u6cb3\u5357"]');
      logInfo(`groupNamesOf(letter="H"): JSON.stringify(actual.slice(3, 6))=${JSON.stringify(actual.slice(3, 6))}`);
      expect(JSON.stringify(actual.slice(3, 6))).assertEqual('["\u9ed1\u9f99\u6c5f","\u6e56\u5317","\u6e56\u5357"]');
      logInfo(`${BUNDLE}GroupNamesOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0004
     * @tc.name      Location_GroupNamesOf_0004
     * @tc.desc      groupNamesOf(letter="STRING") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0004 begin`);
      const actual: string[] = groupNamesOf('STRING');
      logInfo(`groupNamesOf(letter="STRING"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0005
     * @tc.name      Location_GroupNamesOf_0005
     * @tc.desc      groupNamesOf(letter="strin") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0005 begin`);
      const actual: string[] = groupNamesOf('strin');
      logInfo(`groupNamesOf(letter="strin"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0006
     * @tc.name      Location_GroupNamesOf_0006
     * @tc.desc      groupNamesOf(letter="stringx") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0006 begin`);
      const actual: string[] = groupNamesOf('stringx');
      logInfo(`groupNamesOf(letter="stringx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0007
     * @tc.name      Location_GroupNamesOf_0007
     * @tc.desc      groupNamesOf(letter="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0007 begin`);
      const actual: string[] = groupNamesOf('');
      logInfo(`groupNamesOf(letter=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0008
     * @tc.name      Location_GroupNamesOf_0008
     * @tc.desc      groupNamesOf(letter="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0008 begin`);
      const actual: string[] = groupNamesOf('a');
      logInfo(`groupNamesOf(letter="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0009
     * @tc.name      Location_GroupNamesOf_0009
     * @tc.desc      groupNamesOf(letter="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0009 begin`);
      const actual: string[] = groupNamesOf('abc');
      logInfo(`groupNamesOf(letter="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0010
     * @tc.name      Location_GroupNamesOf_0010
     * @tc.desc      groupNamesOf(letter="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0010 begin`);
      const actual: string[] = groupNamesOf('Hello World');
      logInfo(`groupNamesOf(letter="Hello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0011
     * @tc.name      Location_GroupNamesOf_0011
     * @tc.desc      groupNamesOf(letter=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0011 begin`);
      const actual: string[] = groupNamesOf(' ');
      logInfo(`groupNamesOf(letter=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0012
     * @tc.name      Location_GroupNamesOf_0012
     * @tc.desc      groupNamesOf(letter="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0012 begin`);
      const actual: string[] = groupNamesOf('123');
      logInfo(`groupNamesOf(letter="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0013
     * @tc.name      Location_GroupNamesOf_0013
     * @tc.desc      groupNamesOf(letter=" string ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0013 begin`);
      const actual: string[] = groupNamesOf(' string ');
      logInfo(`groupNamesOf(letter=" string "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0014
     * @tc.name      Location_GroupNamesOf_0014
     * @tc.desc      groupNamesOf(letter="stringstring") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0014 begin`);
      const actual: string[] = groupNamesOf('stringstring');
      logInfo(`groupNamesOf(letter="stringstring"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0015
     * @tc.name      Location_GroupNamesOf_0015
     * @tc.desc      groupNamesOf(letter="string_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0015 begin`);
      const actual: string[] = groupNamesOf('string_1');
      logInfo(`groupNamesOf(letter="string_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0016
     * @tc.name      Location_GroupNamesOf_0016
     * @tc.desc      groupNamesOf(letter="xstring") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0016 begin`);
      const actual: string[] = groupNamesOf('xstring');
      logInfo(`groupNamesOf(letter="xstring"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0017
     * @tc.name      Location_GroupNamesOf_0017
     * @tc.desc      groupNamesOf(letter=" STRING ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0017 begin`);
      const actual: string[] = groupNamesOf(' STRING ');
      logInfo(`groupNamesOf(letter=" STRING "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0018
     * @tc.name      Location_GroupNamesOf_0018
     * @tc.desc      groupNamesOf(letter="STRINGSTRING") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0018 begin`);
      const actual: string[] = groupNamesOf('STRINGSTRING');
      logInfo(`groupNamesOf(letter="STRINGSTRING"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0019
     * @tc.name      Location_GroupNamesOf_0019
     * @tc.desc      groupNamesOf(letter="STRING_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0019 begin`);
      const actual: string[] = groupNamesOf('STRING_1');
      logInfo(`groupNamesOf(letter="STRING_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0020
     * @tc.name      Location_GroupNamesOf_0020
     * @tc.desc      groupNamesOf(letter="xSTRING") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0020 begin`);
      const actual: string[] = groupNamesOf('xSTRING');
      logInfo(`groupNamesOf(letter="xSTRING"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0021
     * @tc.name      Location_GroupNamesOf_0021
     * @tc.desc      groupNamesOf(letter=" strin ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0021 begin`);
      const actual: string[] = groupNamesOf(' strin ');
      logInfo(`groupNamesOf(letter=" strin "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0022
     * @tc.name      Location_GroupNamesOf_0022
     * @tc.desc      groupNamesOf(letter="strinstrin") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0022 begin`);
      const actual: string[] = groupNamesOf('strinstrin');
      logInfo(`groupNamesOf(letter="strinstrin"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0023
     * @tc.name      Location_GroupNamesOf_0023
     * @tc.desc      groupNamesOf(letter="strin_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0023 begin`);
      const actual: string[] = groupNamesOf('strin_1');
      logInfo(`groupNamesOf(letter="strin_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0024
     * @tc.name      Location_GroupNamesOf_0024
     * @tc.desc      groupNamesOf(letter="xstrin") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0024 begin`);
      const actual: string[] = groupNamesOf('xstrin');
      logInfo(`groupNamesOf(letter="xstrin"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0025
     * @tc.name      Location_GroupNamesOf_0025
     * @tc.desc      groupNamesOf(letter=" stringx ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0025 begin`);
      const actual: string[] = groupNamesOf(' stringx ');
      logInfo(`groupNamesOf(letter=" stringx "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0026
     * @tc.name      Location_GroupNamesOf_0026
     * @tc.desc      groupNamesOf(letter="stringxstringx") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0026 begin`);
      const actual: string[] = groupNamesOf('stringxstringx');
      logInfo(`groupNamesOf(letter="stringxstringx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0027
     * @tc.name      Location_GroupNamesOf_0027
     * @tc.desc      groupNamesOf(letter="stringx_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0027 begin`);
      const actual: string[] = groupNamesOf('stringx_1');
      logInfo(`groupNamesOf(letter="stringx_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0028
     * @tc.name      Location_GroupNamesOf_0028
     * @tc.desc      groupNamesOf(letter="xstringx") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0028 begin`);
      const actual: string[] = groupNamesOf('xstringx');
      logInfo(`groupNamesOf(letter="xstringx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0029
     * @tc.name      Location_GroupNamesOf_0029
     * @tc.desc      groupNamesOf(letter=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0029 begin`);
      const actual: string[] = groupNamesOf(' a ');
      logInfo(`groupNamesOf(letter=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0030
     * @tc.name      Location_GroupNamesOf_0030
     * @tc.desc      groupNamesOf(letter="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0030 begin`);
      const actual: string[] = groupNamesOf('aa');
      logInfo(`groupNamesOf(letter="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0031
     * @tc.name      Location_GroupNamesOf_0031
     * @tc.desc      groupNamesOf(letter="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0031 begin`);
      const actual: string[] = groupNamesOf('a_1');
      logInfo(`groupNamesOf(letter="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0032
     * @tc.name      Location_GroupNamesOf_0032
     * @tc.desc      groupNamesOf(letter="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0032 begin`);
      const actual: string[] = groupNamesOf('xa');
      logInfo(`groupNamesOf(letter="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0033
     * @tc.name      Location_GroupNamesOf_0033
     * @tc.desc      groupNamesOf(letter=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0033 begin`);
      const actual: string[] = groupNamesOf(' abc ');
      logInfo(`groupNamesOf(letter=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0034
     * @tc.name      Location_GroupNamesOf_0034
     * @tc.desc      groupNamesOf(letter="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0034 begin`);
      const actual: string[] = groupNamesOf('abcabc');
      logInfo(`groupNamesOf(letter="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0035
     * @tc.name      Location_GroupNamesOf_0035
     * @tc.desc      groupNamesOf(letter="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0035 begin`);
      const actual: string[] = groupNamesOf('abc_1');
      logInfo(`groupNamesOf(letter="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0036
     * @tc.name      Location_GroupNamesOf_0036
     * @tc.desc      groupNamesOf(letter="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0036 begin`);
      const actual: string[] = groupNamesOf('xabc');
      logInfo(`groupNamesOf(letter="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0037
     * @tc.name      Location_GroupNamesOf_0037
     * @tc.desc      groupNamesOf(letter=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0037 begin`);
      const actual: string[] = groupNamesOf(' Hello World ');
      logInfo(`groupNamesOf(letter=" Hello World "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0038
     * @tc.name      Location_GroupNamesOf_0038
     * @tc.desc      groupNamesOf(letter="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0038 begin`);
      const actual: string[] = groupNamesOf('Hello WorldHello World');
      logInfo(`groupNamesOf(letter="Hello WorldHello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0039
     * @tc.name      Location_GroupNamesOf_0039
     * @tc.desc      groupNamesOf(letter="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0039 begin`);
      const actual: string[] = groupNamesOf('Hello World_1');
      logInfo(`groupNamesOf(letter="Hello World_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0040
     * @tc.name      Location_GroupNamesOf_0040
     * @tc.desc      groupNamesOf(letter="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0040 begin`);
      const actual: string[] = groupNamesOf('xHello World');
      logInfo(`groupNamesOf(letter="xHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0041
     * @tc.name      Location_GroupNamesOf_0041
     * @tc.desc      groupNamesOf(letter="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0041 begin`);
      const actual: string[] = groupNamesOf('   ');
      logInfo(`groupNamesOf(letter="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0042
     * @tc.name      Location_GroupNamesOf_0042
     * @tc.desc      groupNamesOf(letter="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0042 begin`);
      const actual: string[] = groupNamesOf('  ');
      logInfo(`groupNamesOf(letter="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0043
     * @tc.name      Location_GroupNamesOf_0043
     * @tc.desc      groupNamesOf(letter=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0043 begin`);
      const actual: string[] = groupNamesOf(' _1');
      logInfo(`groupNamesOf(letter=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0044
     * @tc.name      Location_GroupNamesOf_0044
     * @tc.desc      groupNamesOf(letter="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0044 begin`);
      const actual: string[] = groupNamesOf('x ');
      logInfo(`groupNamesOf(letter="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0045
     * @tc.name      Location_GroupNamesOf_0045
     * @tc.desc      groupNamesOf(letter=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0045 begin`);
      const actual: string[] = groupNamesOf(' 123 ');
      logInfo(`groupNamesOf(letter=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0046
     * @tc.name      Location_GroupNamesOf_0046
     * @tc.desc      groupNamesOf(letter="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0046 begin`);
      const actual: string[] = groupNamesOf('123123');
      logInfo(`groupNamesOf(letter="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0047
     * @tc.name      Location_GroupNamesOf_0047
     * @tc.desc      groupNamesOf(letter="123_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0047 begin`);
      const actual: string[] = groupNamesOf('123_1');
      logInfo(`groupNamesOf(letter="123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0048
     * @tc.name      Location_GroupNamesOf_0048
     * @tc.desc      groupNamesOf(letter="x123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_GroupNamesOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0048 begin`);
      const actual: string[] = groupNamesOf('x123');
      logInfo(`groupNamesOf(letter="x123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0049
     * @tc.name      Location_GroupNamesOf_0049
     * @tc.desc      groupNamesOf(letter="klB") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0049 begin`);
      const actual: string[] = groupNamesOf('klB');
      logInfo(`groupNamesOf(letter="klB"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0050
     * @tc.name      Location_GroupNamesOf_0050
     * @tc.desc      groupNamesOf(letter="zh0ufVK8p") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0050 begin`);
      const actual: string[] = groupNamesOf('zh0ufVK8p');
      logInfo(`groupNamesOf(letter="zh0ufVK8p"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0051
     * @tc.name      Location_GroupNamesOf_0051
     * @tc.desc      groupNamesOf(letter="TcXKHbh") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0051 begin`);
      const actual: string[] = groupNamesOf('TcXKHbh');
      logInfo(`groupNamesOf(letter="TcXKHbh"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0052
     * @tc.name      Location_GroupNamesOf_0052
     * @tc.desc      groupNamesOf(letter="g") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0052 begin`);
      const actual: string[] = groupNamesOf('g');
      logInfo(`groupNamesOf(letter="g"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0053
     * @tc.name      Location_GroupNamesOf_0053
     * @tc.desc      groupNamesOf(letter="yQ9omk67dwV") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0053 begin`);
      const actual: string[] = groupNamesOf('yQ9omk67dwV');
      logInfo(`groupNamesOf(letter="yQ9omk67dwV"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0054
     * @tc.name      Location_GroupNamesOf_0054
     * @tc.desc      groupNamesOf(letter="bp50CUf0mJ02") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0054 begin`);
      const actual: string[] = groupNamesOf('bp50CUf0mJ02');
      logInfo(`groupNamesOf(letter="bp50CUf0mJ02"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0055
     * @tc.name      Location_GroupNamesOf_0055
     * @tc.desc      groupNamesOf(letter="U0rVgHW") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0055 begin`);
      const actual: string[] = groupNamesOf('U0rVgHW');
      logInfo(`groupNamesOf(letter="U0rVgHW"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0056
     * @tc.name      Location_GroupNamesOf_0056
     * @tc.desc      groupNamesOf(letter="LUzZ1aoW") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0056 begin`);
      const actual: string[] = groupNamesOf('LUzZ1aoW');
      logInfo(`groupNamesOf(letter="LUzZ1aoW"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0057
     * @tc.name      Location_GroupNamesOf_0057
     * @tc.desc      groupNamesOf(letter="wvmVzv4BU") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0057 begin`);
      const actual: string[] = groupNamesOf('wvmVzv4BU');
      logInfo(`groupNamesOf(letter="wvmVzv4BU"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0058
     * @tc.name      Location_GroupNamesOf_0058
     * @tc.desc      groupNamesOf(letter="n71Wf7") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0058 begin`);
      const actual: string[] = groupNamesOf('n71Wf7');
      logInfo(`groupNamesOf(letter="n71Wf7"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0059
     * @tc.name      Location_GroupNamesOf_0059
     * @tc.desc      groupNamesOf(letter="wUiMo5TeG") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0059 begin`);
      const actual: string[] = groupNamesOf('wUiMo5TeG');
      logInfo(`groupNamesOf(letter="wUiMo5TeG"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0060
     * @tc.name      Location_GroupNamesOf_0060
     * @tc.desc      groupNamesOf(letter="ZqWTow5VJLg") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0060 begin`);
      const actual: string[] = groupNamesOf('ZqWTow5VJLg');
      logInfo(`groupNamesOf(letter="ZqWTow5VJLg"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0061
     * @tc.name      Location_GroupNamesOf_0061
     * @tc.desc      groupNamesOf(letter="6UedXdU") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0061 begin`);
      const actual: string[] = groupNamesOf('6UedXdU');
      logInfo(`groupNamesOf(letter="6UedXdU"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0062
     * @tc.name      Location_GroupNamesOf_0062
     * @tc.desc      groupNamesOf(letter="rC") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0062 begin`);
      const actual: string[] = groupNamesOf('rC');
      logInfo(`groupNamesOf(letter="rC"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0063
     * @tc.name      Location_GroupNamesOf_0063
     * @tc.desc      groupNamesOf(letter="AU") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0063 begin`);
      const actual: string[] = groupNamesOf('AU');
      logInfo(`groupNamesOf(letter="AU"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0064
     * @tc.name      Location_GroupNamesOf_0064
     * @tc.desc      groupNamesOf(letter="P") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0064 begin`);
      const actual: string[] = groupNamesOf('P');
      logInfo(`groupNamesOf(letter="P"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0065
     * @tc.name      Location_GroupNamesOf_0065
     * @tc.desc      groupNamesOf(letter="7wX42mAbN") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0065 begin`);
      const actual: string[] = groupNamesOf('7wX42mAbN');
      logInfo(`groupNamesOf(letter="7wX42mAbN"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0066
     * @tc.name      Location_GroupNamesOf_0066
     * @tc.desc      groupNamesOf(letter="W") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0066 begin`);
      const actual: string[] = groupNamesOf('W');
      logInfo(`groupNamesOf(letter="W"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0067
     * @tc.name      Location_GroupNamesOf_0067
     * @tc.desc      groupNamesOf(letter="Q9IYwn") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0067 begin`);
      const actual: string[] = groupNamesOf('Q9IYwn');
      logInfo(`groupNamesOf(letter="Q9IYwn"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0068
     * @tc.name      Location_GroupNamesOf_0068
     * @tc.desc      groupNamesOf(letter="Pekp0ZE") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0068 begin`);
      const actual: string[] = groupNamesOf('Pekp0ZE');
      logInfo(`groupNamesOf(letter="Pekp0ZE"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0069
     * @tc.name      Location_GroupNamesOf_0069
     * @tc.desc      groupNamesOf(letter="PY29") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0069 begin`);
      const actual: string[] = groupNamesOf('PY29');
      logInfo(`groupNamesOf(letter="PY29"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0070
     * @tc.name      Location_GroupNamesOf_0070
     * @tc.desc      groupNamesOf(letter="VAb3in") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0070 begin`);
      const actual: string[] = groupNamesOf('VAb3in');
      logInfo(`groupNamesOf(letter="VAb3in"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0071
     * @tc.name      Location_GroupNamesOf_0071
     * @tc.desc      groupNamesOf(letter="FXshNBzws") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0071 begin`);
      const actual: string[] = groupNamesOf('FXshNBzws');
      logInfo(`groupNamesOf(letter="FXshNBzws"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0072
     * @tc.name      Location_GroupNamesOf_0072
     * @tc.desc      groupNamesOf(letter="cBeDfjwausM") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0072 begin`);
      const actual: string[] = groupNamesOf('cBeDfjwausM');
      logInfo(`groupNamesOf(letter="cBeDfjwausM"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0073
     * @tc.name      Location_GroupNamesOf_0073
     * @tc.desc      groupNamesOf(letter="PHsKo3b2l") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0073 begin`);
      const actual: string[] = groupNamesOf('PHsKo3b2l');
      logInfo(`groupNamesOf(letter="PHsKo3b2l"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0074
     * @tc.name      Location_GroupNamesOf_0074
     * @tc.desc      groupNamesOf(letter="jWXlLhLXQfP") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0074 begin`);
      const actual: string[] = groupNamesOf('jWXlLhLXQfP');
      logInfo(`groupNamesOf(letter="jWXlLhLXQfP"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_GROUP_NAMES_OF_0075
     * @tc.name      Location_GroupNamesOf_0075
     * @tc.desc      groupNamesOf(letter="eYug0roDmJl") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_GroupNamesOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupNamesOf_0075 begin`);
      const actual: string[] = groupNamesOf('eYug0roDmJl');
      logInfo(`groupNamesOf(letter="eYug0roDmJl"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GroupNamesOf_0075 end`);
    });
  });
}
