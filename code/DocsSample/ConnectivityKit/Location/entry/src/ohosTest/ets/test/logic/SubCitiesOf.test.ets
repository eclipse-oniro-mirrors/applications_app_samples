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
import { subCitiesOf } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for subCitiesOf (30 cases). */
export default function subCitiesOfTest(): void {
  describe('SubCitiesOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0001
     * @tc.name      Location_SubCitiesOf_0001
     * @tc.desc      subCitiesOf(province="string") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_SubCitiesOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0001 begin`);
      const actual: string[] = subCitiesOf('string');
      logInfo(`subCitiesOf(province="string"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0002
     * @tc.name      Location_SubCitiesOf_0002
     * @tc.desc      subCitiesOf(province="STRING") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_SubCitiesOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0002 begin`);
      const actual: string[] = subCitiesOf('STRING');
      logInfo(`subCitiesOf(province="STRING"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0003
     * @tc.name      Location_SubCitiesOf_0003
     * @tc.desc      subCitiesOf(province="strin") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0003 begin`);
      const actual: string[] = subCitiesOf('strin');
      logInfo(`subCitiesOf(province="strin"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0004
     * @tc.name      Location_SubCitiesOf_0004
     * @tc.desc      subCitiesOf(province="stringx") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0004 begin`);
      const actual: string[] = subCitiesOf('stringx');
      logInfo(`subCitiesOf(province="stringx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0005
     * @tc.name      Location_SubCitiesOf_0005
     * @tc.desc      subCitiesOf(province="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0005 begin`);
      const actual: string[] = subCitiesOf('');
      logInfo(`subCitiesOf(province=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0006
     * @tc.name      Location_SubCitiesOf_0006
     * @tc.desc      subCitiesOf(province="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0006 begin`);
      const actual: string[] = subCitiesOf('a');
      logInfo(`subCitiesOf(province="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0007
     * @tc.name      Location_SubCitiesOf_0007
     * @tc.desc      subCitiesOf(province="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0007 begin`);
      const actual: string[] = subCitiesOf('abc');
      logInfo(`subCitiesOf(province="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0008
     * @tc.name      Location_SubCitiesOf_0008
     * @tc.desc      subCitiesOf(province="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0008 begin`);
      const actual: string[] = subCitiesOf('Hello World');
      logInfo(`subCitiesOf(province="Hello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0009
     * @tc.name      Location_SubCitiesOf_0009
     * @tc.desc      subCitiesOf(province=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0009 begin`);
      const actual: string[] = subCitiesOf(' ');
      logInfo(`subCitiesOf(province=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0010
     * @tc.name      Location_SubCitiesOf_0010
     * @tc.desc      subCitiesOf(province="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0010 begin`);
      const actual: string[] = subCitiesOf('123');
      logInfo(`subCitiesOf(province="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0011
     * @tc.name      Location_SubCitiesOf_0011
     * @tc.desc      subCitiesOf(province=" string ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0011 begin`);
      const actual: string[] = subCitiesOf(' string ');
      logInfo(`subCitiesOf(province=" string "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0012
     * @tc.name      Location_SubCitiesOf_0012
     * @tc.desc      subCitiesOf(province="stringstring") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0012 begin`);
      const actual: string[] = subCitiesOf('stringstring');
      logInfo(`subCitiesOf(province="stringstring"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0013
     * @tc.name      Location_SubCitiesOf_0013
     * @tc.desc      subCitiesOf(province="string_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0013 begin`);
      const actual: string[] = subCitiesOf('string_1');
      logInfo(`subCitiesOf(province="string_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0014
     * @tc.name      Location_SubCitiesOf_0014
     * @tc.desc      subCitiesOf(province="xstring") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0014 begin`);
      const actual: string[] = subCitiesOf('xstring');
      logInfo(`subCitiesOf(province="xstring"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0015
     * @tc.name      Location_SubCitiesOf_0015
     * @tc.desc      subCitiesOf(province=" STRING ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0015 begin`);
      const actual: string[] = subCitiesOf(' STRING ');
      logInfo(`subCitiesOf(province=" STRING "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0016
     * @tc.name      Location_SubCitiesOf_0016
     * @tc.desc      subCitiesOf(province="STRINGSTRING") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0016 begin`);
      const actual: string[] = subCitiesOf('STRINGSTRING');
      logInfo(`subCitiesOf(province="STRINGSTRING"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0017
     * @tc.name      Location_SubCitiesOf_0017
     * @tc.desc      subCitiesOf(province="STRING_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0017 begin`);
      const actual: string[] = subCitiesOf('STRING_1');
      logInfo(`subCitiesOf(province="STRING_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0018
     * @tc.name      Location_SubCitiesOf_0018
     * @tc.desc      subCitiesOf(province="xSTRING") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0018 begin`);
      const actual: string[] = subCitiesOf('xSTRING');
      logInfo(`subCitiesOf(province="xSTRING"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0019
     * @tc.name      Location_SubCitiesOf_0019
     * @tc.desc      subCitiesOf(province=" strin ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0019 begin`);
      const actual: string[] = subCitiesOf(' strin ');
      logInfo(`subCitiesOf(province=" strin "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0020
     * @tc.name      Location_SubCitiesOf_0020
     * @tc.desc      subCitiesOf(province="strinstrin") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0020 begin`);
      const actual: string[] = subCitiesOf('strinstrin');
      logInfo(`subCitiesOf(province="strinstrin"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0021
     * @tc.name      Location_SubCitiesOf_0021
     * @tc.desc      subCitiesOf(province="strin_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0021 begin`);
      const actual: string[] = subCitiesOf('strin_1');
      logInfo(`subCitiesOf(province="strin_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0022
     * @tc.name      Location_SubCitiesOf_0022
     * @tc.desc      subCitiesOf(province="xstrin") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0022 begin`);
      const actual: string[] = subCitiesOf('xstrin');
      logInfo(`subCitiesOf(province="xstrin"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0023
     * @tc.name      Location_SubCitiesOf_0023
     * @tc.desc      subCitiesOf(province=" stringx ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0023 begin`);
      const actual: string[] = subCitiesOf(' stringx ');
      logInfo(`subCitiesOf(province=" stringx "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0024
     * @tc.name      Location_SubCitiesOf_0024
     * @tc.desc      subCitiesOf(province="stringxstringx") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0024 begin`);
      const actual: string[] = subCitiesOf('stringxstringx');
      logInfo(`subCitiesOf(province="stringxstringx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0025
     * @tc.name      Location_SubCitiesOf_0025
     * @tc.desc      subCitiesOf(province="stringx_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0025 begin`);
      const actual: string[] = subCitiesOf('stringx_1');
      logInfo(`subCitiesOf(province="stringx_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0026
     * @tc.name      Location_SubCitiesOf_0026
     * @tc.desc      subCitiesOf(province="xstringx") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0026 begin`);
      const actual: string[] = subCitiesOf('xstringx');
      logInfo(`subCitiesOf(province="xstringx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0027
     * @tc.name      Location_SubCitiesOf_0027
     * @tc.desc      subCitiesOf(province=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0027 begin`);
      const actual: string[] = subCitiesOf(' a ');
      logInfo(`subCitiesOf(province=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0028
     * @tc.name      Location_SubCitiesOf_0028
     * @tc.desc      subCitiesOf(province="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0028 begin`);
      const actual: string[] = subCitiesOf('aa');
      logInfo(`subCitiesOf(province="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0029
     * @tc.name      Location_SubCitiesOf_0029
     * @tc.desc      subCitiesOf(province="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_SubCitiesOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0029 begin`);
      const actual: string[] = subCitiesOf('a_1');
      logInfo(`subCitiesOf(province="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SUB_CITIES_OF_0030
     * @tc.name      Location_SubCitiesOf_0030
     * @tc.desc      subCitiesOf(province="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_SubCitiesOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubCitiesOf_0030 begin`);
      const actual: string[] = subCitiesOf('xa');
      logInfo(`subCitiesOf(province="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SubCitiesOf_0030 end`);
    });
  });
}
